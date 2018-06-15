#!/bin/sh
#gyazo-like screenshot using shutter
# exit on first error

NOW="$(date +"%m.%d.%Y.%R")"
filename="/tmp/${NOW}.png"
content_type="image/png"


function shot {
# shutter -e -n -s -o "$filename" &>/dev/null
# scrot -s "$filename" &>/dev/null
gnome-screenshot -a -f $filename &>/dev/null
}

#idk how to implement closing the script when you press "esc" w/o complicating this

#while [[ "$key" == "$'\e'" ]]
#  do
#    exit 0
#done

shot

clientid="c9a6efb3d7932fd"

function upload {
    curl -sH "Authorization: Client-ID $clientid" -H "Expect: " -F "image=@$filename" "https://api.imgur.com/3/image.xml"
}

response=$(upload)

url="${response##*<link>}"
url="${url%%</link>*}"
delete_hash="${response##*<deletehash>}"
delete_hash="${delete_hash%%</deletehash>*}"
echo $url | sed 's/^http:/https:shift/'
echo "Delete page: https://imgur.com/delete/$delete_hash" >&2

xdg-open $url &>/dev/null

if [ "$url" == "" ]; then
  echo "url empty, probably the screenshot utility is not installed "
fi

rm -f $filename

exit 0
