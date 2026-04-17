"""Mandarin ↔ Hainanese representation dictionary.

The fine-tuned SenseVoice model outputs Mandarin characters (because training labels
are Mandarin). The UI needs to display a Hainanese-representation side-by-side.

We store:
  - `hainan_char`: a Hainanese dialect-character form (using Min-specific characters
    like 汝/食/莫/倥 where standard Mandarin uses 你/吃/别/饿). Falls back to the
    Mandarin form when no dialect rendering exists.
  - `hainan_pinyin`: Peng'im-style Hainanese romanisation (white-word, BBM-lite).
    Short-hand only; sourced from user-curated seeds + Mandarin pinyin fallback via
    pypinyin (clearly marked as fallback in the response).

Extend the seed table as the project collects more curated pairs. Never block the
ASR request on a missing entry — always degrade gracefully.
"""

from __future__ import annotations

from functools import lru_cache
from typing import Any


# Hand-curated pairs: Mandarin form -> (hainan_char, hainan_pinyin)
# Seeded from apps/web/src/views/TranslateView.vue pinyinMap, extended with common
# vocabulary we expect to encounter. Keys are normalised by stripping spaces.
_SEED: dict[str, tuple[str, str]] = {
    # greetings
    "你好": ("汝好", "lṳ hó"),
    "你好，多少钱？": ("汝好，若干钱？", "lṳ hó, jiō-gán-chîⁿ?"),
    "谢谢": ("多谢", "do xiā"),
    "多谢": ("多谢", "do xiā"),
    "不用谢": ("免客气", "bián kheh-khì"),
    "再见": ("再见", "coi-kèⁿ"),
    "对不起": ("对不起", "duì-put-khí"),
    "没关系": ("无要紧", "bô iàu-gín"),
    "请": ("请", "chíⁿ"),
    "请问": ("请问", "chíⁿ-mūn"),

    # common pronouns / basics
    "你": ("汝", "lṳ"),
    "我": ("我", "guá"),
    "他": ("伊", "i"),
    "我们": ("咱", "lán"),
    "是": ("是", "sī"),
    "不是": ("唔是", "m̄-sī"),
    "是的": ("是", "sī"),
    "好": ("好", "hó"),
    "不好": ("唔好", "m̄-hó"),
    "吃": ("食", "chia̍h"),
    "喝": ("啉", "lim"),
    "去": ("去", "khì"),
    "来": ("来", "lâi"),
    "看": ("看", "khuàⁿ"),
    "走": ("走", "cháu"),
    "坐": ("坐", "chē"),
    "睡觉": ("睏", "khùn"),
    "买": ("买", "bé"),
    "卖": ("卖", "bē"),
    "拿": ("提", "theh"),
    "说": ("讲", "kóng"),
    "听": ("听", "thiaⁿ"),
    "做": ("做", "chò"),
    "有": ("有", "ū"),
    "没有": ("无", "bô"),

    # question words
    "多少钱": ("若干钱", "jiō-gán-chîⁿ"),
    "多少": ("若干", "jiō-gán"),
    "哪里": ("叨位", "tô-uī"),
    "去哪儿": ("去叨位", "khì tô-uī"),
    "什么": ("什么", "siáⁿ-mih"),
    "怎么办": ("怎么办", "cái-iūⁿ-pān"),
    "怎么": ("怎么", "cái-iūⁿ"),
    "为什么": ("为啥物", "uī siáⁿ-mih"),
    "什么时候": ("什么时候", "siáⁿ-mih sî-hāu"),

    # food items (common in dataset)
    "苹果": ("苹果", "pêng-kó"),
    "香蕉": ("弓蕉", "keng-chio"),
    "瓜": ("瓜", "kua"),
    "桔": ("柑仔", "kam-á"),
    "梨": ("梨仔", "lâi-á"),
    "菠萝": ("王梨", "ông-lâi"),
    "葡萄": ("葡萄", "phû-tô"),
    "柠檬": ("柠檬", "lêng-bông"),
    "白菜": ("白菜", "pe̍h-chhài"),
    "米": ("米", "bí"),
    "面包": ("面包", "mī-pau"),
    "牛奶": ("牛奶", "gû-ling"),
    "酸奶": ("酸奶", "sng-ling"),
    "咖啡": ("咖啡", "ka-pi"),
    "茶": ("茶", "tê"),
    "饭": ("饭", "pn̄g"),
    "炒饭": ("炒饭", "chhá-pn̄g"),
    "面条": ("面条", "mī-tiâu"),
    "汤": ("汤", "thng"),
    "鱼": ("鱼", "hî"),

    # animals
    "狗": ("狗", "káu"),
    "猫": ("猫", "niau"),
    "鸟": ("鸟", "chiáu"),
    "牛": ("牛", "gû"),
    "马": ("马", "bé"),
    "羊": ("羊", "iûⁿ"),
    "猪": ("猪", "ti"),
    "鸡": ("鸡", "ke"),
    "鸭": ("鸭", "ah"),

    # places / objects
    "家": ("厝", "chhù"),
    "房子": ("厝", "chhù"),
    "学校": ("学校", "ha̍k-hāu"),
    "医院": ("医院", "i-īⁿ"),
    "商店": ("店", "tiàm"),
    "车": ("车", "chhia"),
    "电话": ("电话", "tiān-uē"),
    "手机": ("手机", "chhiú-ki"),
    "电脑": ("电脑", "tiān-náu"),
    "电视": ("电视", "tiān-sī"),

    # time
    "今天": ("今日", "kin-ji̍t"),
    "明天": ("明日", "bîn-á-ji̍t"),
    "昨天": ("昨日", "cha-ji̍t"),
    "现在": ("现在", "hiān-chāi"),
    "早上": ("早起", "chái-khí"),
    "晚上": ("暗时", "àm-sî"),
    "中午": ("中昼", "tiong-tàu"),

    # numbers
    "一": ("一", "it"),
    "二": ("二", "jī"),
    "三": ("三", "saⁿ"),
    "四": ("四", "sì"),
    "五": ("五", "gō·"),
    "六": ("六", "la̍k"),
    "七": ("七", "chhit"),
    "八": ("八", "peh"),
    "九": ("九", "káu"),
    "十": ("十", "cha̍p"),

    # sport terms (present in dataset)
    "篮球": ("篮球", "nâ-kiû"),
    "排球": ("排球", "pâi-kiû"),
    "乒乓球": ("乒乓球", "phin-phóng-kiû"),
    "打乒乓球": ("拍乒乓球", "phah phin-phóng-kiû"),

    # misc from dataset
    "会议": ("会议", "huē-gī"),
    "准备": ("准备", "chún-pī"),
    "操作": ("操作", "chhau-chok"),
    "研究": ("研究", "gián-kiù"),
    "安装": ("安装", "an-chong"),
    "外表": ("外表", "guā-piáu"),
    "鼓励": ("鼓励", "kó·-lē"),
    "客户": ("客户", "kheh-hō·"),
    "宽度": ("阔度", "khoah-tō·"),
    "环保": ("环保", "khoân-pó"),
    "任务": ("任务", "jīm-bū"),
    "圣诞节": ("圣诞节", "sèng-tàn-cheh"),
    "计划": ("计划", "kè-uē"),
    "其他": ("其他", "kî-thaⁿ"),
    "看书": ("看册", "khuàⁿ-chheh"),
    "刷碗": ("洗碗", "sé-uáⁿ"),
}


@lru_cache(maxsize=1)
def _pypinyin_available() -> bool:
    try:
        import pypinyin  # noqa: F401
        return True
    except Exception:
        return False


def _fallback_pinyin(text: str) -> str:
    """Best-effort: Mandarin pinyin as a rough stand-in when no Hainanese entry exists."""
    if not _pypinyin_available():
        return ""
    import pypinyin
    try:
        syls = pypinyin.lazy_pinyin(text, style=pypinyin.Style.TONE)
        return "-".join(syls)
    except Exception:
        return ""


_PUNCT_TRANS = str.maketrans(
    "",
    "",
    "。，、；：？！“”‘’（）《》【】,.;:?!\"'()[]<>—-…· ",
)


def _normalise(text: str) -> str:
    """Strip trailing punctuation/whitespace so ITN output still hits the dictionary."""
    if not text:
        return ""
    stripped = text.strip()
    # Drop trailing punctuation cluster (most common in SenseVoice ITN output)
    while stripped and stripped[-1] in "。，、；：？！,.;:?! \"'":
        stripped = stripped[:-1]
    return stripped


def lookup(mandarin: str) -> dict[str, Any]:
    """Return a structured representation for display.

    Fields:
      mandarin      – input text (echoed, trailing punctuation stripped)
      hainan_char   – dialect-char rendering if we have one, else same as mandarin
      hainan_pinyin – Peng'im-style romanisation
      source        – "curated" when from seed, "mandarin_pinyin_fallback" when generated,
                      or "unknown" when nothing is available
      in_dict       – whether the full string matched a seed entry
    """
    key = _normalise(mandarin or "")
    if not key:
        return {
            "mandarin": "",
            "hainan_char": "",
            "hainan_pinyin": "",
            "source": "unknown",
            "in_dict": False,
        }

    # Exact match first
    if key in _SEED:
        hainan_char, hainan_pinyin = _SEED[key]
        return {
            "mandarin": key,
            "hainan_char": hainan_char,
            "hainan_pinyin": hainan_pinyin,
            "source": "curated",
            "in_dict": True,
        }

    # Character-level compose: build char form and pinyin by looking up each char.
    # Skip punctuation so the resulting pinyin string stays clean.
    char_parts: list[str] = []
    pinyin_parts: list[str] = []
    any_hit = False
    for ch in key:
        if ch.translate(_PUNCT_TRANS) == "":
            char_parts.append(ch)
            continue
        if ch in _SEED:
            hc, hp = _SEED[ch]
            char_parts.append(hc)
            pinyin_parts.append(hp)
            any_hit = True
        else:
            char_parts.append(ch)
            pinyin_parts.append(_fallback_pinyin(ch))

    hainan_char = "".join(char_parts)
    hainan_pinyin = "-".join(p for p in pinyin_parts if p)

    return {
        "mandarin": key,
        "hainan_char": hainan_char,
        "hainan_pinyin": hainan_pinyin,
        "source": "character_compose" if any_hit else "mandarin_pinyin_fallback",
        "in_dict": False,
    }


def known_entries() -> list[dict[str, str]]:
    """Return the seed entries so the UI can preview/search the dictionary."""
    return [
        {"mandarin": k, "hainan_char": v[0], "hainan_pinyin": v[1]}
        for k, v in _SEED.items()
    ]
