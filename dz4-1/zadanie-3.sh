#!/usr/bin/env bash
hosts=('192.168.88.118' '192.168.88.141' '87.250.250.24')
for i in {1..5}
do
date >> hosts.log
    for h in ${hosts[@]}
    do
	curl -Is --connect-timeout 5 $h:80
        echo "check" $h status=$? >> hosts.log
    done
done
