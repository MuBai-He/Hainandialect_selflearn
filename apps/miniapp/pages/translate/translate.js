Page({
  data: {
    sourceText: "你好",
    resultText: "点击按钮后，这里将接业务 API 的翻译结果。"
  },

  onInput(event) {
    this.setData({ sourceText: event.detail.value });
  },

  handleTranslate() {
    this.setData({
      resultText: `占位结果: ${this.data.sourceText}`
    });
  }
});

