#!/usr/bin/env bash
# Point poshanka [provider].exec at this script (or any script with the same NDJSON contract).
set -euo pipefail

CTL="${NOTREDCTL:-notredctl}"
SOCKET_ARGS=()
if [[ -n "${NOTRED_SOCKET:-}" ]]; then
    SOCKET_ARGS=(--socket "$NOTRED_SOCKET")
fi

while true; do
    "$CTL" "${SOCKET_ARGS[@]}" subscribe
    sleep 3
done
