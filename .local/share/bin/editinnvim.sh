#!/usr/bin/env bash


tempfile=$(mktemp)


hyprctl dispatch sendshortcut "CTRL,A,"
hyprctl dispatch sendshortcut "CTRL,C,"
sleep 0.1

wl-paste > $tempfile

hyprctl dispatch exec "[float; centerwindow]" "bash -c \"st -e nvim $tempfile && cat $tempfile | wl-copy -n && hyprctl dispatch sendshortcut \\\"CTRL,V,\\\"\""
