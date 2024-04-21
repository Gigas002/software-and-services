#!/bin/bash

output=$(hyprctl activeworkspace)

workspace_id=$(echo $output | grep -o -E '[0-9]+[^0-9]')

IFS=''
read -ra ADDR <<<"$workspace_id"

for i in "${ADDR[@]}"; do
    id=$i
done

echo $id

hyprctl keyword workspace $id,gapsin:0,gapsout:0,rounding:false,bordersize:0
