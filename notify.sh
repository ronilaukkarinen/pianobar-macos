#!/bin/bash

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|songStationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\|stationCount\|station[0-9]*\)=' /dev/stdin) # don't overwrite $1...

case "$1" in
	songstart)
    wget $coverArt -O /tmp/pandora >/dev/null 2>&1 && convert /tmp/pandora /tmp/pandora.png
    notify-send -i /tmp/pandora.png "$title" "$artist\n$album"
    rm /tmp/pandora.png /tmp/pandora &>/dev/null
esac
