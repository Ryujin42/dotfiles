#!/bin/sh

title=$(playerctl metadata title 2>/dev/null)
echo "$title"

