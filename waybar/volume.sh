#!/bin/sh

VOLUME=$(pamixer --get-volume)

MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    echo "  Muted"
else
    if [ "$VOLUME" -ge 70 ]; then
        ICON=""  # Loud
    elif [ "$VOLUME" -ge 30 ]; then
        ICON=""  # Medium
    else
        ICON=""  # Low
    fi
    echo "$ICON  $VOLUME%"
fi

