#!/bin/bash

# default to ~/images/screenshots
screenshots_dir="${1:-$HOME/images/screenshots}"

# Get current timestamp in the format YYYY-MM-DD_HH-MM-SS
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# watershot -c directory $screenshots_dir
grimblast --freeze copysave area $screenshots_dir/$timestamp.png
