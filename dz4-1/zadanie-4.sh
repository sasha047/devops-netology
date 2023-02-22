hosts=('192.168.88.118' '192.168.88.141' '87.250.250.24')
ip_out=0

while (($ip_out == 0))
do
    for h in ${hosts[@]}
    do
	curl -Is --connect-timeout 5 $h:80
	ip_out=$?
	if (($ip_out != 0))
	then
	    echo "    ERROR  " $h status=$ip_out >>hosts_out.log
	fi
    done
done
