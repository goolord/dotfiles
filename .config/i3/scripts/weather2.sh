#!/usr/bin/env bash

################################
# Shows info about the weather (in Port Charlotte) from accuweather.com
################################

full=""
short=""
color=#c9c9ff
status=0


URL='https://www.accuweather.com/en/us/port-charlotte-fl/33952/weather-forecast/332284'
SITE="$(curl -s "$URL")"

weather="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 }'| head -1)"
temp="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°" }'| head -1)"


if [[ $weather == *thunder* || $weather == *Thunder* ]]; then
    icon=""
else
    if [[ $weather == *rain* || $weather == *Rain* ]]; then
        icon=""
    else
        if [[ $weather == *cloud* || $weather == *Cloud* ]]; then
            icon=""
        else
            icon=""
        fi
    fi
fi


full="$icon $temp"
short="$temp"


echo $full
echo $short
echo $color
exit $status
