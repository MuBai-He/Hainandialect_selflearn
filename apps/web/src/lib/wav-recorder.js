// Minimal mic recorder that yields both a WAV blob (for offline upload) and a live
// 16-bit PCM stream (for the streaming WebSocket). We use the Web Audio API's
// AudioWorklet so we can control the frame format precisely — MediaRecorder alone
// can't give us raw PCM in a cross-browser-reliable way.
//
// Two consumers share one mic:
//   - offlineBlobPromise():  resolves to a WAV Blob (mono, 16k, int16) at stop().
//   - onPCM(callback):       receives Int16Array chunks (mono, 16k) in near-real-time.

const TARGET_SAMPLE_RATE = 16000;
const WORKLET_CODE = `
class PCMTap extends AudioWorkletProcessor {
  process(inputs) {
    const input = inputs[0];
    if (!input || input.length === 0) return true;
    const ch = input[0];  // mono — we requested 1 channel in user media
    if (!ch || ch.length === 0) return true;
    // Copy out because the buffer is reused across calls.
    const f32 = new Float32Array(ch.length);
    f32.set(ch);
    this.port.postMessage(f32, [f32.buffer]);
    return true;
  }
}
registerProcessor("pcm-tap", PCMTap);
`;

function float32ToInt16(f32) {
  const out = new Int16Array(f32.length);
  for (let i = 0; i < f32.length; i++) {
    let s = Math.max(-1, Math.min(1, f32[i]));
    out[i] = s < 0 ? s * 0x8000 : s * 0x7fff;
  }
  return out;
}

function resampleFloat32(input, srcSampleRate, tgtSampleRate) {
  if (srcSampleRate === tgtSampleRate) return input;
  const ratio = srcSampleRate / tgtSampleRate;
  const outLen = Math.round(input.length / ratio);
  const out = new Float32Array(outLen);
  for (let i = 0; i < outLen; i++) {
    const srcIdx = i * ratio;
    const i0 = Math.floor(srcIdx);
    const i1 = Math.min(i0 + 1, input.length - 1);
    const frac = srcIdx - i0;
    out[i] = input[i0] * (1 - frac) + input[i1] * frac;
  }
  return out;
}

function encodeWav(int16, sampleRate) {
  const header = new ArrayBuffer(44);
  const view = new DataView(header);
  const byteLen = int16.length * 2;
  const write = (off, s) => {
    for (let i = 0; i < s.length; i++) view.setUint8(off + i, s.charCodeAt(i));
  };
  write(0, "RIFF");
  view.setUint32(4, 36 + byteLen, true);
  write(8, "WAVE");
  write(12, "fmt ");
  view.setUint32(16, 16, true);          // PCM chunk size
  view.setUint16(20, 1, true);           // PCM format
  view.setUint16(22, 1, true);           // channels = 1
  view.setUint32(24, sampleRate, true);
  view.setUint32(28, sampleRate * 2, true); // byte rate
  view.setUint16(32, 2, true);           // block align
  view.setUint16(34, 16, true);          // bits per sample
  write(36, "data");
  view.setUint32(40, byteLen, true);
  return new Blob([header, int16.buffer], { type: "audio/wav" });
}

export async function createMicRecorder({ onPCM } = {}) {
  if (!navigator.mediaDevices?.getUserMedia) {
    throw new Error("当前浏览器不支持麦克风。");
  }
  const stream = await navigator.mediaDevices.getUserMedia({
    audio: {
      channelCount: 1,
      echoCancellation: true,
      noiseSuppression: true,
      autoGainControl: true,
    },
    video: false,
  });

  const AudioContextCtor = window.AudioContext || window.webkitAudioContext;
  const audioCtx = new AudioContextCtor();
  if (audioCtx.state === "suspended") {
    await audioCtx.resume();
  }
  const blob = new Blob([WORKLET_CODE], { type: "application/javascript" });
  const workletUrl = URL.createObjectURL(blob);
  await audioCtx.audioWorklet.addModule(workletUrl);
  URL.revokeObjectURL(workletUrl);

  const source = audioCtx.createMediaStreamSource(stream);
  const node = new AudioWorkletNode(audioCtx, "pcm-tap");

  const srcSr = audioCtx.sampleRate;
  const recordedChunks = [];
  const pcmListeners = new Set();
  if (typeof onPCM === "function") pcmListeners.add(onPCM);

  node.port.onmessage = (ev) => {
    const f32 = ev.data; // Float32Array at srcSr
    // Downmix already mono; resample to target
    const f32_16k = resampleFloat32(f32, srcSr, TARGET_SAMPLE_RATE);
    const int16 = float32ToInt16(f32_16k);
    recordedChunks.push(int16);
    pcmListeners.forEach((fn) => {
      try { fn(int16); } catch (err) { console.error(err); }
    });
  };

  source.connect(node);
  // No destination: we don't want the mic echoing out the speakers.

  let stopped = false;
  return {
    sampleRate: TARGET_SAMPLE_RATE,
    onPCM(fn) { pcmListeners.add(fn); },
    offPCM(fn) { pcmListeners.delete(fn); },
    async stop() {
      if (stopped) {
        return encodeWav(mergeInt16(recordedChunks), TARGET_SAMPLE_RATE);
      }
      stopped = true;
      try { node.port.onmessage = null; } catch {}
      try { node.disconnect(); } catch {}
      try { source.disconnect(); } catch {}
      try { stream.getTracks().forEach((t) => t.stop()); } catch {}
      try { await audioCtx.close(); } catch {}
      return encodeWav(mergeInt16(recordedChunks), TARGET_SAMPLE_RATE);
    },
  };
}

function mergeInt16(chunks) {
  const total = chunks.reduce((n, c) => n + c.length, 0);
  const out = new Int16Array(total);
  let o = 0;
  for (const c of chunks) {
    out.set(c, o);
    o += c.length;
  }
  return out;
}
