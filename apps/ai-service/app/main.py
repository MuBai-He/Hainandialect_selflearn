from typing import Literal

from fastapi import FastAPI
from pydantic import BaseModel, Field


app = FastAPI(
    title="Hainan Dialect AI Service",
    version="0.1.0",
    description="Internal AI service for translation, pronunciation scoring, and recommendation."
)


class TranslateRequest(BaseModel):
    source_language: str = Field(..., min_length=2)
    target_language: str = Field(..., min_length=2)
    text: str = Field(..., min_length=1)


class TranslateResponse(BaseModel):
    source_language: str
    target_language: str
    source_text: str
    translated_text: str
    confidence: float
    strategy: str


class PronunciationRequest(BaseModel):
    target_text: str = Field(..., min_length=1)
    transcript_text: str = Field(..., min_length=1)
    audio_url: str | None = None


class PronunciationResponse(BaseModel):
    overall_score: float
    fluency_score: float
    accuracy_score: float
    hints: list[str]


class RecommendationRequest(BaseModel):
    level: Literal["beginner", "intermediate", "advanced"]
    weak_tags: list[str] = Field(default_factory=list)


class RecommendationResponse(BaseModel):
    level: str
    recommendations: list[str]


DEMO_TRANSLATIONS = {
    ("zh-CN", "nan-hn", "你好"): "sample_hn_hello",
    ("zh-CN", "nan-hn", "谢谢"): "sample_hn_thanks",
    ("en", "nan-hn", "How much is this?"): "sample_hn_buy_question",
}


@app.get("/health")
def health() -> dict[str, str]:
    return {
        "status": "ok",
        "service": "ai-service",
        "message": "Internal AI service scaffold is running."
    }


@app.post("/v1/translate", response_model=TranslateResponse)
def translate(payload: TranslateRequest) -> TranslateResponse:
    key = (payload.source_language, payload.target_language, payload.text)
    translated_text = DEMO_TRANSLATIONS.get(key, f"[placeholder] {payload.text}")
    strategy = "glossary_match" if key in DEMO_TRANSLATIONS else "placeholder_fallback"
    confidence = 0.92 if key in DEMO_TRANSLATIONS else 0.45

    return TranslateResponse(
        source_language=payload.source_language,
        target_language=payload.target_language,
        source_text=payload.text,
        translated_text=translated_text,
        confidence=confidence,
        strategy=strategy,
    )


@app.post("/v1/pronunciation/score", response_model=PronunciationResponse)
def score_pronunciation(payload: PronunciationRequest) -> PronunciationResponse:
    target_length = len(payload.target_text.strip())
    transcript_length = len(payload.transcript_text.strip())
    diff = abs(target_length - transcript_length)

    accuracy = max(45.0, 100.0 - (diff * 8.0))
    fluency = max(50.0, 96.0 - (diff * 5.0))
    overall = round((accuracy + fluency) / 2.0, 2)

    return PronunciationResponse(
        overall_score=overall,
        fluency_score=round(fluency, 2),
        accuracy_score=round(accuracy, 2),
        hints=[
            "Keep the reviewed reference transcript close to the target teaching phrase.",
            "Replace placeholder scoring with phoneme or syllable alignment in phase 2.",
            "Store all approved recordings for later supervised tuning.",
        ],
    )


@app.post("/v1/recommendations", response_model=RecommendationResponse)
def recommend(payload: RecommendationRequest) -> RecommendationResponse:
    pool = {
        "beginner": [
            "Daily greetings",
            "Travel essentials",
            "Food ordering phrases",
        ],
        "intermediate": [
            "Longer shopping dialogue",
            "Pronunciation correction drills",
            "Culture-linked vocabulary",
        ],
        "advanced": [
            "Regional variant comparison",
            "Government service vocabulary",
            "Corpus contribution and review",
        ],
    }

    recommendations = pool[payload.level]
    if payload.weak_tags:
        recommendations = recommendations + [f"Focused review for: {', '.join(payload.weak_tags)}"]

    return RecommendationResponse(level=payload.level, recommendations=recommendations)

