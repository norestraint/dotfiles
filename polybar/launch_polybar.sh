#!/usr/bin/env bash
# Kill all running instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example -c $HOME/.config/polybar/config.ini & disown
  done
else
  polybar --reload example & disown
fi
