#!/bin/sh
# based on: https://github.com/philj56/tofi/issues/102

list=$(cliphist list)  # Original list for reuse in lookup
trimmed=$(printf "%s" "$list" | cut -f2-)  # List without leading numbers
index=$(printf "%s" "$trimmed" | tofi --print-index=true --prompt-text="search: ")
if [ -n "$index" ]; then
	# Use index to find correct line in original list
	printf "%s" "$list" | awk "NR==$index {print; quit}" | cliphist decode | wl-copy
fi
