# speaches-git (local PKGBUILD)

Arch Linux package definition for [Speaches](https://github.com/speaches-ai/speaches): an OpenAI-compatible HTTP/WebSocket server for **STT**, **TTS**, **voice chat**, and the **realtime API**. Official docs live at [speaches.ai](https://speaches.ai/).

This folder is for **private use** (not submitted to the AUR). Adjust `PKGBUILD` as you like before `makepkg`.

---

## Your goals (how this README is oriented)

| Priority | What you want |
|----------|----------------|
| **Languages** | **Russian first**, **English second**. Other languages are out of scope here. |
| **Hardware** | **AMD GPU (9070 XT) + ROCm** when possible; **CPU** as fallback. |
| **Mode** | **Realtime conversation** (voice in → LLM → voice out), **not** “translate speech to English”. |
| **Features** | Both **STT** and **TTS** must work end-to-end. |
| **Client** | You run **[Project AIRI](https://github.com/moeru-ai/airi)** as the companion UI; Speaches is the **local STT+TTS** backend. |

---

## 1. Build and install (Arch)

From this directory:

```bash
makepkg -si
```

- Installs Speaches and the **`speaches-cli`** tool into `/usr` (Python **3.12**, see upstream `pyproject.toml`).
- Pulls **`ctranslate2`**, **`faster-whisper`**, and other dependencies from **PyPI** via **`uv pip install`** during packaging (network, time, disk).

Start the API server (same as [installation](https://speaches.ai/installation/)):

```bash
speaches-serve
```

By default the app listens on **`0.0.0.0:8000`**. Open [http://localhost:8000/docs](http://localhost:8000/docs) if Swagger/UI is enabled in your build.

---

## 2. AMD 9070 XT, ROCm, and this package (read this)

**What this PKGBUILD does:** it runs **`uv pip install`** with **stock PyPI wheels** (including **`ctranslate2`** / **`faster-whisper`** for STT). It **`depends` on `onnxruntime-opt-rocm`** for ONNX-based models (e.g. Kokoro). Official Docker images lean **NVIDIA CUDA**; Speaches does not ship a first-party ROCm stack.

**What that means for you:**

1. **CPU** — Works out of the box; fine for testing and lighter models.
2. **ROCm on Arch + PyPI STT wheels** — Treat as **experimental**; see [speaches#22](https://github.com/speaches-ai/speaches/issues/22).
3. **Practical** — For lowest latency many users use **CUDA-class** hardware or upstream **CUDA** containers; on Arch + AMD you typically use **CPU** PyPI wheels unless you customize.

**Realtime latency:** [Realtime API](https://speaches.ai/usage/realtime-api/).

---

## 3. Models with exact Hugging Face links (Russian + English)

### Speech-to-text (multilingual Whisper — **Russian + English**)

Use **only** models **without** the `.en` suffix (`.en` = English-only).

| Role | Model ID (use in Speaches & AIRI) | Hugging Face |
|------|-------------------------------------|--------------|
| **Recommended quality** | `Systran/faster-whisper-large-v3` | [Systran/faster-whisper-large-v3](https://huggingface.co/Systran/faster-whisper-large-v3) |
| **Lighter / less VRAM** | `Systran/faster-whisper-medium` | [Systran/faster-whisper-medium](https://huggingface.co/Systran/faster-whisper-medium) |
| **Smaller** | `Systran/faster-whisper-small` | [Systran/faster-whisper-small](https://huggingface.co/Systran/faster-whisper-small) |

Whisper **large v3** is natively **multilingual** (includes **ru** and **en** per the OpenAI Whisper v3 family). For Russian-heavy audio, pass **`language=ru`** on transcriptions when you know the input language (see below).

**Do not use** `Systran/faster-whisper-small.en` (or any `*.en`) for Russian—they are **English-only**.

### Text-to-speech

**Russian:** In the Speaches build you install from this PKGBUILD, **Kokoro’s bundled voice table does not include Russian** (voices are `en`, `ja`, `zh`, `es`, `fr`, `hi`, `it`, `pt-br` locales in `kokoro.py`). For **native Russian TTS**, use **Piper** mirrors under `speaches-ai/piper-*`:

| Language | Example model ID | Hugging Face |
|----------|------------------|--------------|
| **Russian (pick one)** | `speaches-ai/piper-ru_RU-irina-medium` | [speaches-ai/piper-ru_RU-irina-medium](https://huggingface.co/speaches-ai/piper-ru_RU-irina-medium) |
| Russian (alt.) | `speaches-ai/piper-ru_RU-ruslan-medium` | [speaches-ai/piper-ru_RU-ruslan-medium](https://huggingface.co/speaches-ai/piper-ru_RU-ruslan-medium) |
| Russian (alt.) | `speaches-ai/piper-ru_RU-denis-medium` | [speaches-ai/piper-ru_RU-denis-medium](https://huggingface.co/speaches-ai/piper-ru_RU-denis-medium) |
| Russian (alt.) | `speaches-ai/piper-ru_RU-dmitri-medium` | [speaches-ai/piper-ru_RU-dmitri-medium](https://huggingface.co/speaches-ai/piper-ru_RU-dmitri-medium) |
| **English (Piper)** | `speaches-ai/piper-en_US-amy-medium` | [speaches-ai/piper-en_US-amy-medium](https://huggingface.co/speaches-ai/piper-en_US-amy-medium) |
| **English (Kokoro, high quality)** | `speaches-ai/Kokoro-82M-v1.0-ONNX` | [speaches-ai/Kokoro-82M-v1.0-ONNX](https://huggingface.co/speaches-ai/Kokoro-82M-v1.0-ONNX) |

- **RU dialogue:** use a **`piper-ru_RU-…`** model.
- **EN dialogue:** use **Kokoro** (voices such as `af_heart` — see [Text-to-Speech](https://speaches.ai/usage/text-to-speech/)) **or** a **`piper-en_US-…`** model.
- **AIRI limitation:** the desktop app typically exposes **one** active TTS pipeline in **Vocalization**. If you need both fluent Russian and fluent English voices, you either **switch TTS model in settings** when you change language, or standardise on **Piper** for both locales (two different Piper model IDs still imply switching unless AIRI adds per-language routing—check new AIRI releases).

**Download into Speaches cache:**

```bash
export SPEACHES_BASE_URL="http://localhost:8000"

speaches-cli model download Systran/faster-whisper-large-v3
speaches-cli model download speaches-ai/piper-ru_RU-irina-medium
speaches-cli model download speaches-ai/Kokoro-82M-v1.0-ONNX
# optional second English pipe:
# speaches-cli model download speaches-ai/piper-en_US-amy-medium
```

---

## 4. Russian and English — STT (transcribe, **not** translate)

| Endpoint | Behaviour |
|----------|-----------|
| **`POST /v1/audio/transcriptions`** | **Transcribe** (keeps Russian as Cyrillic text when `language=ru` or auto). **Use this.** |
| **`POST /v1/audio/translations`** | Targets **translation to English**. **Do not use** for “keep Russian”. |

**Curl ([Speech-to-Text](https://speaches.ai/usage/speech-to-text/)):**

```bash
export SPEACHES_BASE_URL="http://localhost:8000"
export TRANSCRIPTION_MODEL_ID="Systran/faster-whisper-large-v3"

curl -s "$SPEACHES_BASE_URL/v1/audio/transcriptions" \
  -F "file=@audio.wav" \
  -F "model=$TRANSCRIPTION_MODEL_ID" \
  -F "language=ru"
```

For **English-only** segments, use `-F "language=en"` (or omit for auto-detect on multilingual models).

---

## 5. TTS (OpenAI-compatible `/v1/audio/speech`)

**Piper** (`speaches-ai/piper-ru_RU-irina-medium`): the API still requires a **`voice`** string; Speaches’ Piper path does not map OpenAI voices the same way as Kokoro—use any **non-empty placeholder** if the UI forces a value (e.g. `"default"`). Prefer **`response_format": "wav"`** or **`mp3`**; **`opus` / `aac`** are **not** supported ([limitations](https://speaches.ai/usage/text-to-speech/)).

**Kokoro** (English etc.): set **`voice`** to a real Kokoro id (e.g. `af_heart`). See [Text-to-Speech](https://speaches.ai/usage/text-to-speech/).

```bash
export SPEACHES_BASE_URL="http://localhost:8000"

curl "$SPEACHES_BASE_URL/v1/audio/speech" -s -H "Content-Type: application/json" \
  --output out.wav \
  --data @- << EOF
{
  "input": "Привет, это тест.",
  "model": "speaches-ai/piper-ru_RU-irina-medium",
  "voice": "default",
  "response_format": "wav"
}
EOF
```

---

## 6. Speaches “voice chat” / realtime vs AIRI

- **Speaches [Voice Chat](https://speaches.ai/usage/voice-chat/)** and **[Realtime API](https://speaches.ai/usage/realtime-api/)** expect **`CHAT_COMPLETION_BASE_URL`** (and optional API key) so Speaches itself can call an LLM. That path is useful for **OpenAI-Realtime-style clients** talking **directly to Speaches**.
- **With AIRI**, the usual split is: **AIRI → LLM (e.g. Ollama)** for “brain”, **AIRI → Speaches** only for **STT/TTS** via **OpenAI-compatible HTTP**. You do **not** need Speaches voice-chat env for that pattern—see **section 8**.

If you *do* use Speaches-native realtime/voice-chat (no AIRI in the middle), set e.g.:

```bash
export CHAT_COMPLETION_BASE_URL="http://localhost:11434/v1"
# export CHAT_COMPLETION_API_KEY="..."   # if your LLM requires it
```

Restart **`speaches-serve`**. Use **`intent=conversation`** (default) for full dialogue; **`intent=transcription`** is subtitles-only. For Russian audio hints, see [Realtime API](https://speaches.ai/usage/realtime-api/) (`language=ru`, `transcription_model=…`).

---

## 7. Optional tools (not dependencies of the PKGBUILD)

- **`jq`** — used in many Speaches doc snippets (`speaches-cli ... | jq ...`).
- **OpenAI SDKs** — require a **non-empty** dummy `OPENAI_API_KEY` and `OPENAI_BASE_URL` pointing at Speaches ([STT](https://speaches.ai/usage/speech-to-text/), [TTS](https://speaches.ai/usage/text-to-speech/))).
- **Microphone / VAD** — realtime doc warns about **feedback** (TTS into the same mic). Use **headphones** for serious voice chat.

---

## 8. Project AIRI: bind Speaches after it is working

AIRI is the **desktop/web companion** ([overview](https://airi.moeru.ai/docs/en/docs/overview/), repo [moeru-ai/airi](https://github.com/moeru-ai/airi)). The manual’s **Settings → Service Sources** and **Body modules** ([setup-and-use](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/setup-and-use/), [configuration](https://airi.moeru.ai/docs/en/docs/manual/config/)) are where providers are wired.

AIRI’s docs also note desktop features like **Transcriptions** / local synthesis are still maturing; **running Speaches separately** and pointing AIRI at it is a solid approach.

### 8.1 Architecture (what talks to what)

| Piece | Role | Typical base URL |
|-------|------|------------------|
| **Speaches** (this package) | **STT** + **TTS** (OpenAI-compatible `/v1/audio/...`) | `http://127.0.0.1:8000/v1` |
| **Ollama** (or other) | **LLM** (“Consciousness” / chat) | `http://127.0.0.1:11434/v1` |

Use **`127.0.0.1`** (not `localhost`) to avoid IPv6 / resolution quirks in embedded webviews.

### 8.2 Ollama + AIRI desktop (from AIRI manual)

If the LLM is **Ollama**, the [desktop guide](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/) states you should set **`OLLAMA_ORIGINS=*`** in the environment and **restart Ollama** so browser/Electron surfaces can reach it.

### 8.3 Speaches: confirm STT/TTS before touching AIRI

1. `speaches-serve` running on **port 8000**.
2. Models downloaded (`speaches-cli model download …` from **section 3**).
3. Quick tests: **section 4** (transcription) and **section 5** (speech) with `curl`.

### 8.4 AIRI: Service Sources → OpenAI-compatible

The manual recommends **“OpenAI compatible API”** when a provider speaks the OpenAI HTTP shape ([setup-and-use](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/setup-and-use/) — *Service Sources*).

Create / edit providers roughly like this (exact field names follow the AIRI UI):

**A. Transcription (STT)**

- Type: **OpenAI-compatible** (or the closest preset AIRI offers).
- **Base URL:** `http://127.0.0.1:8000/v1`
- **API key:** any non-empty string (Speaches often does not care; many OpenAI SDKs reject empty keys—use e.g. `local`).
- **Model:** `Systran/faster-whisper-large-v3` (or `Systran/faster-whisper-medium` / `small` from **section 3**).

**B. Speech / TTS**

- Again **OpenAI-compatible**, **same** `http://127.0.0.1:8000/v1` if AIRI allows a second provider; if the UI merges STT+TTS onto one profile, reuse the same Speaches base URL.
- **Model:** e.g. `speaches-ai/piper-ru_RU-irina-medium` for Russian, or `speaches-ai/Kokoro-82M-v1.0-ONNX` for English Kokoro.
- **Voice:** for Kokoro use a real voice id (`af_heart`, …). For Piper, a **non-empty placeholder** (e.g. `default`) is usually enough if the field is mandatory.

**C. Chat / LLM (not Speaches)**

- **Consciousness** → your **Ollama** / OpenRouter / etc. endpoint (e.g. `http://127.0.0.1:11434/v1` for Ollama), **not** the Speaches URL.

### 8.5 AIRI: Body modules

Per [setup-and-use](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/setup-and-use/):

1. **Consciousness** — select the **LLM** service + chat model (Ollama, etc.).
2. **Hearing** — choose microphone, then the **STT** service source + **Whisper model id** above. Enable **auto-send transcribed text** if you want push-to-talk / stream behaviour without extra confirmation (tune **auto-send delay**).
3. **Vocalization** — select the **TTS** service + **TTS model id** + voice (Kokoro) or placeholder (Piper). Use **Test voice** in the panel when available.

**Important:** AIRI must call **`/v1/audio/transcriptions`**, not translations, for Russian text. If AIRI exposes a “translate” vs “transcribe” toggle anywhere, choose **transcribe**.

### 8.6 “Realtime conversation” with AIRI

With the split **AIRI (LLM) + Speaches (STT/TTS)**, “realtime” feel depends on **AIRI’s audio pipeline** (mic → STT → LLM → TTS) and your **GPU/CPU** under Speaches. That matches the product direction in [AIRI’s overview](https://airi.moeru.ai/docs/en/docs/overview/) while Speaches remains the OpenAI-compatible speech server ([STT](https://speaches.ai/usage/speech-to-text/), [TTS](https://speaches.ai/usage/text-to-speech/)).

Speaches’ **WebSocket Realtime API** is for clients that speak that protocol directly to Speaches; use it if you build a custom client—not required for the AIRI wiring above.

---

## 9. Quick checklist

| Step | Action |
|------|--------|
| 1 | `makepkg -si`, then `speaches-serve` |
| 2 | `speaches-cli model download …` (**section 3**) |
| 3 | `curl` STT/TTS tests (**sections 4–5**) |
| 4 | Start **Ollama** (or LLM), set **`OLLAMA_ORIGINS=*`** if using AIRI desktop + Ollama |
| 5 | **AIRI** → Service Sources + Body modules (**section 8**) |
| 6 | STT: **transcriptions** + `language=ru` when speaking Russian; avoid **translations** |
| 7 | GPU: **CPU works** with this PKGBUILD; **ROCm** = DIY ([#22](https://github.com/speaches-ai/speaches/issues/22)) |

---

## 10. Official references

### Speaches

- [Installation](https://speaches.ai/installation/)
- [Speech-to-Text](https://speaches.ai/usage/speech-to-text/)
- [Text-to-Speech](https://speaches.ai/usage/text-to-speech/)
- [Voice Chat](https://speaches.ai/usage/voice-chat/)
- [Realtime API](https://speaches.ai/usage/realtime-api/)
- [Configuration](https://speaches.ai/configuration/)
- [GitHub: speaches-ai/speaches](https://github.com/speaches-ai/speaches)

### AIRI

- [Introduction / overview](https://airi.moeru.ai/docs/en/docs/overview/)
- [Desktop (Tamagotchi) guide](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/)
- [Setup and use (settings walkthrough)](https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/setup-and-use/)
- [Configuration guide](https://airi.moeru.ai/docs/en/docs/manual/config/)
- [GitHub: moeru-ai/airi](https://github.com/moeru-ai/airi)
