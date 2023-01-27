#!/usr/bin/env bash
while ((1==1))
do
	wget -q --spider http://192.168.88.117:8080

if (($? != 0))
then
	echo "offline"  >> wget.log
else
	echo "online" >> wget.log
fi

done
