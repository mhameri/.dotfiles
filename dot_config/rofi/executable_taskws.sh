#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10

# [ ! -f /tmp/window_switch ] && rofi -show window -kb-accept-entry '![64],!Alt+Tab,!Alt+Alt_L' -kb-element-next 'Alt+Tab' -kb-element-prev 'Alt+ISO_Left_Tab' -kb-cancel 'Alt+Escape,Escape' -selected-row 1 -theme-str 'mainbox {children:[listview];}' -no-fixed-num-lines -pid /tmp/window_switch -no-grab-lazy && rm /tmp/window_switch

dir="$HOME/.config/rofi/themes"
theme='tasks-2'

## Run
# rofi \
#     -show window \
#     -theme ${dir}/${theme}.rasi

[ ! -f /tmp/window_switch ] && rofi \
    -show windowcd \
    -theme ${dir}/${theme}.rasi -replace -selected-row 1 -pid /tmp/window_switch -no-grab-lazy && rm /tmp/window_switch