#!/bin/bash

# Check if AC and Battery directories exist
AC_PATH="/sys/class/power_supply/AC0/online"
BAT_PATH="/sys/class/power_supply/BAT0/status"

if [[ -f "$AC_PATH" && -f "$BAT_PATH" ]]; then
    AC_STATUS=$(cat "$AC_PATH")
    BAT_STATUS=$(cat "$BAT_PATH")

    echo "AC: $AC_STATUS, Battery: $BAT_STATUS"
else
    echo "Power supply paths not found. Are you sure this is the correct system?"
fi

