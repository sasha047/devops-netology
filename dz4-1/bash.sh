#!/usr/bin/env bash
while ((1==1))
do
	curl  https://192.168.88.117:8080
if (($? != 0))
then
	date >> curl.log
else
	break
fi
	sleep 5
done
