#!/bin/bash
#xdg-open "$(locate -i / | rofi -lines 12 -padding 18 -threads 0 -width 80 -dmenu -i -p "Find")"

xdg-open "$(locate -i / | rofi -lines 12 -font 'Noto Sans 18' -padding 18 -threads 0 -width 80 -dmenu -i -p "Find")"
