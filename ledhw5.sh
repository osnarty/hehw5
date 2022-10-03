#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.
# this is modified to turn led on , turn off , get status and flash led

#absolute path to USR3 LED
LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# function to remove the trigger
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash , status, or blink   \n e.g. ledhw5 on \n 	ledhw5 blink 3 "
  exit 2
fi

echo "The LED Command that was passed is: $1"

#Turn LED ON
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
  
#Turn LED OFF  
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"

#Flash LED
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
  
#Get LED status  
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
  

#Blink led n times
elif [ "$1" == "blink" ]; then
  echo "Blinking LED $2 times"
  n=$2
  echo “1” >> “$LED3_PATH/brightness”
  while [ $n -gt 0 ]
  do
    echo "0" >> "$LED3_PATH/brightness"
    sleep 1
    echo "1" >> "$LED3_PATH/brightness"
    sleep 1
    ((n--))
  done
  
fi
echo "End of the LED Bash Script"
