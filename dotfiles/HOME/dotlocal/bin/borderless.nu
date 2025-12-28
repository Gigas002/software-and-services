#!/usr/bin/env nu

# Get active workspace info
let output = (hyprctl activeworkspace)

# Extract the workspace ID (first number in the output)
let id = (
    $output
    | parse -r '(?<id>\d+)'
    | get 0.id
)

echo $id

# hyprctl keyword decoration:dim_inactive false

# Apply workspace rules
hyprctl keyword workspace $"($id),gapsin:0,gapsout:0,rounding:false,bordersize:0"

# Alternative style:
# hyprctl keyword workspace $"($id),gapsin:3,gapsout:8,rounding:true,bordersize:2"
