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

# Outer loop: subscribe, clear tray on exit, and retry.
# If trayd is not running, trayctl subscribe exits immediately and we retry
# after a short sleep — no need to poll the process table separately.
while true; do
    trayctl subscribe

    # trayd exited or was not reachable — clear the tray so stale items
    # are not shown while the daemon is down.
    echo '[]'

    sleep 2
done
