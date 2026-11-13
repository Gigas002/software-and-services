#!/bin/sh
# steam-nolib32 launcher wrapper.

# Always use the 64-bit Steam Runtime 3 client. The legacy ubuntu12_32 client
# needs 32-bit host libraries, which this system lacks.
export STEAM_FORCE_CLIENT="${STEAM_FORCE_CLIENT:-steamrt64}"

# Valve's Proton builds need WoW64 mode to run without 32-bit host libraries.
export PROTON_USE_WOW64="${PROTON_USE_WOW64:-1}"

# The 64-bit client runs inside a pressure-vessel container and sees system
# compat tools as /run/host/usr/share/steam/compatibilitytools.d/..., but
# launches games on the host, where /run/host does not exist. Tools that run
# inside a Steam Linux Runtime are unaffected (the runtime maps /run/host).
# For host-run tools (no require_tool_appid, e.g. proton-*-native), keep a
# shim in the user's compatibilitytools.d whose path is valid on both sides.
sys_tools=/usr/share/steam/compatibilitytools.d
user_tools="${XDG_DATA_HOME:-$HOME/.local/share}/Steam/compatibilitytools.d"
marker=.steam-nolib32-shim

if [ -d "${user_tools%/*}" ]; then
  mkdir -p "$user_tools"
  for sys in "$sys_tools"/*/; do
    sys=${sys%/}
    [ -f "$sys/toolmanifest.vdf" ] || continue
    grep -q require_tool_appid "$sys/toolmanifest.vdf" && continue
    shim="$user_tools/${sys##*/}"
    # a symlink to the system tool is exactly the broken case: replace it
    if [ -L "$shim" ] && [ "$(readlink -f "$shim")" = "$sys" ]; then
      rm -f "$shim"
    fi
    # never touch a user's own tool directory
    if [ -e "$shim" ] && [ ! -f "$shim/$marker" ]; then
      continue
    fi
    mkdir -p "$shim"
    cp -f "$sys/compatibilitytool.vdf" "$sys/toolmanifest.vdf" "$shim/"
    for exe in "$sys"/*; do
      [ -f "$exe" ] && [ -x "$exe" ] || continue
      printf '#!/bin/sh\nexec "%s" "$@"\n' "$exe" > "$shim/${exe##*/}"
      chmod 755 "$shim/${exe##*/}"
    done
    : > "$shim/$marker"
  done
  # drop shims whose system tool was uninstalled
  for shim in "$user_tools"/*/; do
    shim=${shim%/}
    if [ -f "$shim/$marker" ] && [ ! -d "$sys_tools/${shim##*/}" ]; then
      rm -rf "$shim"
    fi
  done
fi

exec /usr/lib/steam/steam "$@"
