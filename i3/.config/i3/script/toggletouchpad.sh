#!/bin/bash
if [ xinput list-props 12 | sed -n 's/.*Device Enabled (165):\(.*\).*/\1/p' | sed 's/^[[:space:]]*//' -eq "1" ]; then
    xinput set-prop 12 165 0
    exit
fi
if [ xinput list-props 12 | sed -n 's/.*Device Enabled (165):\(.*\).*/\1/p' | sed 's/^[[:space:]]*//' -eq "0" ]; then
    xinput set-prop 12 165 0
    exit
fi
