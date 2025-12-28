#!/usr/bin/env nu

# Get active workspace info
let output = (hyprctl activeworkspace)

# Extract workspace ID (first number found)
let id = (
    $output
    | parse -r '(?<id>\d+)'
    | get 0.id
)

echo $id

# hyprctl keyword decoration:dim_inactive true

# Apply workspace rules
hyprctl keyword workspace $"($id),gapsin:3,gapsout:8,rounding:true,bordersize:2"
