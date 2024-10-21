#!/bin/bash

position=$(playerctl position)
duration=$(playerctl metadata mpris:length)
duration_seconds=$((duration / 1000000))

if [[ -n "$position" && -n "$duration_seconds" && $duration_seconds -gt 0 ]]; then
    progress=$(( (position * 100) / duration_seconds ))
    echo "{\"value\": \"$progress\"}"
else
    echo "{\"value\": \"0\"}"
fi

