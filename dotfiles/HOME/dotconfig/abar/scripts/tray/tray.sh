#!/usr/bin/env bash
# tray.sh — Reference abar tray script.
#
# Streams tray-state change events from trayd via `trayctl subscribe`, emitting
# one JSON array of tray items per stdout line.  abar reads those lines as
# Vec<MinimalTrayItem>.
#
# Click behaviour is configured in [tray] in config.toml, not here.
#
# Requires: trayctl, trayd

# Outer loop: reconnect automatically when trayd is not running or restarts.
while true; do
    trayctl subscribe
    # trayd not available or disconnected; pause before retrying.
    sleep 3
done
