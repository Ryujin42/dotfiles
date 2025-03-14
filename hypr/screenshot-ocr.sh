#!/bin/bash

TEMP_IMG=$(mktemp /tmp/ocr_screenshot.XXXXXX.png)

grim -g "$(slurp)" "$TEMP_IMG"

tesseract "$TEMP_IMG" - | wl-copy

rm "$TEMP_IMG"

