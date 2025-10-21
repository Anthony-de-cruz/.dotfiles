#!/usr/bin/env bash
#
# Author: Anthony de Cruz
#
# Basic script for handling current lid state.

LID_STATE=$(cat /proc/acpi/button/lid/LID*/state | awk '{print $2}')
BUILTIN_DISPLAY="eDP-1"
EXTERNAL_DISPLAYS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}' | grep -v "$BUILTIN_DISPLAY")

if [ "$LID_STATE" == "closed" ]; then
    if [ -z "$EXTERNAL_DISPLAYS" ]; then
        systemctl suspend
    else
        hyprctl keyword monitor "$BUILTIN_DISPLAY, disable" > /dev/null
    fi
else
    hyprctl keyword monitor "$BUILTIN_DISPLAY, preferred, 0x0, 1.566667" > /dev/null
fi
