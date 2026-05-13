# AIRI configuration

This document explains the details for [AIRI](https://github.com/moeru-ai/airi) configuration. It is targeted for users on `Arch Linux` distros, Russian language users, users who want to run everything locally with their own models and users with AMD GPUs.
However, with minor changes this guide should be applicable for any `Arch Linux` user, and with more tweaks - probably - Windows users as well.

Reference guide: https://airi.moeru.ai/docs/en/docs/manual/tamagotchi/setup-and-use

## Consciousness/LLM

TODO:

- how to pass `--think=false` to AIRI? Maybe adding `<think></think>` to prompt?

We use `ollama` here as easy-to-use local option and because it has `rocm` support:

```sh
paru -S ollama-rocm
ollama serve
```

Next, download model. Prefer using ones from `ollama` [webpage](https://ollama.com/search):

```sh
# in case you want a custom model from huggingface:
wget https://huggingface.co/LuffyTheFox/Qwen3.6-35B-A3B-Uncensored-Wasserstein-Uncesored.Q4_K_P.gguf -O qwen35b.q4.gguf
ollama create qwen35b -f <(echo "FROM ./qwen35b.q4.gguf")

# or just download and run directly from ollama provided models
ollama run qwen3.6 --think=false
```

The `--think=false` part is important for realtime chat, without it model will think for QUITE A WHILE before responding.

## Vocalization/TTS

TODO

## Hearing/STT

TODO:

- realtime chat?
- direct language transcribe instead of transcribe -> translate -> send?

### whisper.cpp

Reference: https://github.com/ggml-org/whisper.cpp


**9950X3D + RX 9070 XT:** pick **either** HIP (`GGML_HIP`) **or** Vulkan (`GGML_VULKAN`) inside **whisper’s** ggml tree — not “standalone ggml vs whisper”. Confirm ISA with `rocminfo | grep -i gfx` (9070 XT is often **`gfx1201`**).

**1-1) whisper.cpp — CPU + Zen 5 SIMD (`WHISPER_USE_SYSTEM_GGML=OFF`)**

```sh
cmake -B build-w-cpu -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_OPENMP=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-cpu -j"10"
```

**1-2) whisper.cpp — Vulkan on 9070 XT (`WHISPER_USE_SYSTEM_GGML=OFF`)**

```sh
cmake -B build-w-vk -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_OPENMP=ON \
  -DGGML_VULKAN=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-vk -j"10"
```

**1-3) whisper.cpp — ROCm HIP on 9070 XT (`WHISPER_USE_SYSTEM_GGML=OFF`)**

```sh
cmake -B build-w-hip -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DGGML_HIP=ON \
  -DGPU_TARGETS="gfx1201" \
  -DGGML_OPENMP=ON \
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-hip -j"10"
```

**2-1) System ggml — CPU + Zen 5 SIMD (`WHISPER_USE_SYSTEM_GGML=ON`)**

**2-1 (A) ggml**

```sh
cmake -B build-ggml-cpu -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr"
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_OPENMP=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DGGML_BUILD_TESTS=OFF \
  -DGGML_BUILD_EXAMPLES=OFF

cmake --build build-ggml-cpu -j"10"
cmake --install build-ggml-cpu
```

**2-1 (B) whisper.cpp**

```sh
cmake -B build-w-cpu-sysggml -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DWHISPER_USE_SYSTEM_GGML=ON \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-cpu-sysggml -j"10"
```

**2-2) System ggml — Vulkan on 9070 XT (`WHISPER_USE_SYSTEM_GGML=ON`)**

**2-2 (A) ggml**

```sh
cmake -B build-ggml-vk -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr"
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_OPENMP=ON \
  -DGGML_VULKAN=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DGGML_BUILD_TESTS=OFF \
  -DGGML_BUILD_EXAMPLES=OFF

cmake --build build-ggml-vk -j"10"
cmake --install build-ggml-vk
```

**2-2 (B) whisper.cpp**

```sh
cmake -B build-w-vk-sysggml -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DWHISPER_USE_SYSTEM_GGML=ON \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-vk-sysggml -j"10"
```

**2-3) System ggml — ROCm HIP on 9070 XT (`WHISPER_USE_SYSTEM_GGML=ON`)**

**2-3 (A) ggml**

```sh
cmake -B build-ggml-hip -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr"
  -DGGML_HIP=ON \
  -DGPU_TARGETS="gfx1201" \
  -DGGML_OPENMP=ON \
  -DGGML_NATIVE=ON \
  -DGGML_LTO=ON \
  -DGGML_FMA=ON \
  -DGGML_F16C=ON \
  -DGGML_AVX512=ON \
  -DGGML_AVX512_VBMI=ON \
  -DGGML_AVX512_VNNI=ON \
  -DGGML_AVX512_BF16=ON \
  -DGGML_AVX_VNNI=ON \
  -DGGML_BUILD_TESTS=OFF \
  -DGGML_BUILD_EXAMPLES=OFF

cmake --build build-ggml-hip -j"10"
cmake --install build-ggml-hip
```

**2-3 (B) whisper.cpp**

```sh
cmake -B build-w-hip-sysggml -G Ninja -S . \
  -DCMAKE_BUILD_TYPE=Release \
  -DWHISPER_USE_SYSTEM_GGML=ON \
  -DCMAKE_PREFIX_PATH="/usr" \
  -DWHISPER_BUILD_SERVER=ON \
  -DWHISPER_BUILD_TESTS=OFF

cmake --build build-w-hip-sysggml -j"10"
```

Models:

```sh
paru -S whisper.cpp-model-large-v3-turbo
```

Manual downloads: [whisper.cpp/models](https://github.com/ggml-org/whisper.cpp/tree/master/models). Server binary and flags: [server example](https://github.com/ggml-org/whisper.cpp/blob/master/examples/server/server.cpp).

```sh
# TODO: document language (-l ru?) and thread count for 9950X3D
whisper-server -t 8
```

### sherpa-onnx

TODO

https://huggingface.co/k2-fsa/sherpa-onnx-models/tree/main

```
sherpa-onnx-offline-parallel-server \
  --sense-voice=/path/to/model.onnx \
  --tokens=/path/to/tokens.txt \
  --num-threads=4 \
  --port=6006
```

### speaches

[Speaches](https://github.com/speaches-ai/speaches) is an **OpenAI-compatible** local server for **STT/TTS** over HTTP; it does **not** run **`whisper-server`** from **whisper.cpp**. The **cmake blocks above** are only for **whisper.cpp** / **ggml**. Local packaging and AIRI wiring: [`speaches-git/README.md`](speaches-git/README.md).

## Vision

TODO
