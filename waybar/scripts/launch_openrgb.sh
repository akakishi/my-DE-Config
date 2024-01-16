#!/bin/bash
is_openrgb_ServerExist=`ps -ef|grep -m 1 openrgb|grep -v "grep"|wc -l`
if [ "$is_openrgb_ServerExist" = "0" ]; then
	echo "openrgb_server not found" > /dev/null 2>&1
elif [ "$is_openrgb_ServerExist" = "1" ]; then
	killall openrgb
fi

openrgb --startminimized &
