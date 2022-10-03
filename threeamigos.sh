#!/bin/bash
#this script sums the first 3 numbers and subtracts it from the 4 with the subtractmachine script
#ex. ./threeamigos 10 10 10 15
#sum= 30
#difference = 15 , it will countdown from 15 14 13 12 .... to 1

sum=$(($1+$2+$3))
echo "Sum = $sum"

./subtractmachine.sh $sum $4
