#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 channel(s) seperated by comma"
  exit 1
fi

chan="$1"

sudo mdk4 wlx007211008662 d -c '$chan' -w  /home/tb12as/whitelist

