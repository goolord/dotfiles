#!/bin/sh
# weather
wttr="$(curl -s http://wttr.in/port-charlotte)"
echo "$wttr" | head -n 4 | tail -n 2 

