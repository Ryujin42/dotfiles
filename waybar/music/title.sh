#!/bin/sh

raw_title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
arturl=$(playerctl metadata mpris:artUrl)

# Reformat title
title=$(echo "$raw_title" | sed \
    -e 's/\\/\\\\/g' \
    -e 's/"/\\"/g' \
    -e "s/'/\\'/g" \
    -e 's/`/\\`/g' \
    -e 's/\$/\\\$/g' \
    -e 's/\*/\\*/g' \
    -e 's/\//\\\//g' \
    -e 's/|/\\|/g' \
    -e 's/;/\\;/g')

# Calculate timings
rawposition=$(playerctl position)
rawlength=$(echo "$(playerctl metadata mpris:length) / 1000000" | bc)

positionhours=$(echo "$rawposition / 3600" | bc)
positionminutes=$(printf "%02d" $(echo "($rawposition % 3600) / 60" | bc))
positionseconds=$(printf "%02d" $(echo "$rawposition % 60" | bc))

lengthhours=$(echo "$rawlength / 3600" | bc)
lengthminutes=$(printf "%02d" $(echo "($rawlength % 3600) / 60" | bc))
lengthseconds=$(printf "%02d" $(echo "$rawlength % 60" | bc))

if [ "$lengthhours" -gt 0 ]; then
    position="${positionhours}:${positionminutes}:${positionseconds}"
    length="${lengthhours}:${lengthminutes}:${lengthseconds}"
else
    position="${positionminutes}:${positionseconds}"
    length="${lengthminutes}:${lengthseconds}"
fi

# Calculate progress bar
progress=$(echo "($rawposition * 50) / $rawlength" | bc)
bar=$(printf "█%.0s" $(seq 1 $progress))
empty=$(printf "░%.0s" $(seq 1 $((50 - $progress))))
progressbar="$bar$empty"

# Echo information with progress bar
echo "{\"text\": \"$title\", \"tooltip\": \"$title\n$artist\n\n[$progressbar]\n$position / $length\"}"

