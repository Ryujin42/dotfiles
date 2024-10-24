#!/bin/sh

raw_title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
arturl=$(playerctl metadata mpris:artUrl)

# reformat title
title=$(echo "$raw_title" | sed \
    -e 's/\\/\\\\/g' \
    -e 's/"/\\"/g' \
    -e "s/'/\\'/g" \
    -e 's/`/\\`/g' \
    -e 's/\$/\\\$/g' \
    -e 's/\*/\\*/g' \
    -e 's/&/\\&/g' \
    -e 's/|/\\|/g' \
    -e 's/;/\\;/g')

# calculate timings
rawposition=$(playerctl position)
rawlength=$(echo "$(playerctl metadata mpris:length) / 1000000" | bc)

positionhours=$(echo "$raw_position / 3600" | bc)
positionminutes=$(printf "%02d" $(echo "($rawposition % 3600) / 60" | bc))
positionseconds=$(printf "%02d" $(echo "$rawposition % 60" | bc))

lengthhours=$(echo "$raw_length / 3600" | bc)
lengthminutes=$(printf "%02d" $(echo "($rawlength % 3600) / 60" | bc))
lengthseconds=$(printf "%02d" $(echo "$rawlength % 60" | bc))

if [ "$lengthhours" -gt 0 ]; then
    position="${positionhours}:${positionminutes}:${positionseconds}"
    length="${lengthhours}:${lengthminutes}:${lengthseconds}"
else
    position="${positionminutes}:${positionseconds}"
    length="${lengthminutes}:${lengthseconds}"
fi

# Echo informations
echo "{\"text\": \"$title\", \"tooltip\": \"$title\n$artist\n$position / $length\"}"

