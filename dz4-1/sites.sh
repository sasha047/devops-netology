#!/usr/bin/env bash

host=('192.168.88.117' '192.168.88.141' '87.250.250.242')
timeout=5
for i in {1..5}
do
date >> host.log
	for h in ${host[@]}
	do
		curl -Is --connect-timeout $timeout $h:80 >/dev/null
		echo $h status=$? >> host.log
	done
done
