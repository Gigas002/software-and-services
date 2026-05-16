# speaches (run from source)

[Speaches](https://github.com/speaches-ai/speaches) — OpenAI-compatible local STT/TTS server. Official docs: [speaches.ai](https://speaches.ai/).

---

## 1. Clone

```sh
git clone https://github.com/speaches-ai/speaches
cd speaches
```

---

## 2. Install dependencies

```sh
uv sync
```

`uv` reads `.python-version` (3.12), downloads Python 3.12 into its own cache (`~/.local/share/uv/python/`) if needed, creates `.venv/`, and installs everything including `speaches-cli`. Nothing touches system Python or `/usr`.

### Fix ctranslate2 (one-time, Arch Linux)

`ctranslate2` ships a `.so` with an executable stack flag that the kernel rejects. Clear it once after `uv sync`:

```sh
patchelf --clear-execstack .venv/lib/python3.12/site-packages/ctranslate2.libs/libctranslate2-bc15bf3f.so.4.5.0
```

If the filename differs (after an update), find it with:

```sh
glob .venv/**/libctranslate2*.so*   # nushell
# or
fd .venv -name "libctranslate2*.so*"
```

---

## 3. Download models

Use `HF_HOME=.` to keep models inside the cloned directory (in `./hub/`). Do **not** use `--local-dir` — it bypasses the HF cache structure and speaches won't find the models.

```sh
# STT — multilingual Whisper (Russian + English)
HF_HOME=. uv run hf download Systran/faster-whisper-large-v3

# TTS — Kokoro (English)
HF_HOME=. uv run hf download speaches-ai/Kokoro-82M-v1.0-ONNX

# TTS — Piper (Russian)
HF_HOME=. uv run hf download speaches-ai/piper-ru_RU-irina-medium
```

---

## 4. Run

```sh
HF_HOME=. uv run uvicorn --factory --host 0.0.0.0 speaches.main:create_app
```

Server listens on `0.0.0.0:8000`. Web UI + Swagger at [http://localhost:8000](http://localhost:8000).

---

## 5. AIRI wiring

| Field              | Value                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------- |
| **Base URL**       | `http://127.0.0.1:8000/v1`                                                             |
| **API key**        | any non-empty string, e.g. `local`                                                     |
| **STT model**      | `Systran/faster-whisper-large-v3`                                                      |
| **TTS model**      | `speaches-ai/Kokoro-82M-v1.0-ONNX` (EN) or `speaches-ai/piper-ru_RU-irina-medium` (RU) |
| **Voice (Kokoro)** | `af_aoede`, `af_heart`, etc.                                                           |
| **Voice (Piper)**  | any non-empty placeholder, e.g. `default`                                              |

Use `127.0.0.1` not `localhost` to avoid IPv6 resolution quirks in Electron/webviews.

For STT, AIRI must call **`/v1/audio/transcriptions`** (not translations) — check the AIRI panel if there's a transcribe/translate toggle.

---

## 6. ROCm (AMD 9070 XT)

Stock PyPI wheels are CPU / CUDA oriented. ROCm support is experimental — see [speaches#22](https://github.com/speaches-ai/speaches/issues/22).

---

## 7. Updating

```sh
git pull
uv sync
```

Re-run the `patchelf` fix if `ctranslate2` was updated.
