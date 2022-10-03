#!/bin/bash
# this program will invoke ledhw5 and 
#a. The first invocation will turn the LED on.
#b. The second invocation will turn the LED off.
#c. The third invocation will read status.
#d. The fourth invocation will flash the LED.
#e. The fifth invocation will blink the LED 3 times

./ledhw5.sh on
echo -e " \n"

./ledhw5.sh off
echo -e " \n"

./ledhw5.sh status
echo -e " \n"

./ledhw5.sh flash
echo -e " \n"

./ledhw5.sh blink 3
