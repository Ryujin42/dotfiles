#!/bin/sh

status=$(playerctl status 2>/dev/null)
if [ "$status" == "Playing" ]; then
    echo ""
else
    echo ""
fi

