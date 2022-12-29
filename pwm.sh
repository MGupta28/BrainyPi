#!/bin/bash

function gpiopwm() {
	
	echo "function"
	var_count=0
   	repeat=1000
	
	while [ $var_count -lt $repeat ]
   	do
		echo "while 1"
		sleep_low=$(awk -v freq="5000" -v duty="5"  'BEGIN{print (1/freq)*((100-duty)/100)}')
		sleep_high=$(awk -v freq="5000" -v duty="5"  'BEGIN{print (1/freq)*((100-(100-duty))/100)}')
		duty=$((duty+1))
		echo "conut $var_count"
		echo "duty $duty"
		
        echo 1 > /sys/class/gpio/gpio150/value
        sleep $sleep_high
		echo "sleep high $sleep_high"
        echo 0 > /sys/class/gpio/gpio150/value
        let var_count=var_count+1
        if [ $var_count -le $repeat ]
		then
			echo "while2"
			sleep $sleep_low
			echo "sleep low $sleep_low"
		fi
    	done
}
echo 150 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio150/direction
duty=0
while [ true ]
do
	gpiopwm $duty
	done
