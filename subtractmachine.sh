#!/bin/bash
# this programs subtracts the smaller # from the larger # and prints out the difference
# then it will count down the difference to 1
# ex. ./subtractmachine.sh 10 5
# 10 is greater than 5 , difference is 5
# countdown: 5 , 4 , 3 ,2 , 1

if [ $1 -gt $2 ]
then
	difference=$(($1-$2))
	echo $1 is larger than $2
else
	difference=$(($2-$1))
	echo $2 is larger than $1
fi

echo "Difference = $difference"
echo

counter=$diff

while [ $counter -gt 0 ]
do	
	echo "Countdown = $counter"
((counter--))
done
