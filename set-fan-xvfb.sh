#!/bin/bash

Xvfb :99 -screen 0 640x480x8 &
XVFB_PID=$!
sleep 2

DISPLAY=:99 XAUTHORITY=/dev/null nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
DISPLAY=:99 XAUTHORITY=/dev/null nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=70"

kill $XVFB_PID
