#!/bin/bash
# This script will test the stability of the raspberry pi by recordkeeping the data for the frequency and temperature before and after stress testing.
# Author: Eric Williams


# clear the screen.
clear


# header
echo "Raspberry Pi Stability Test"


while:
 # defintions
 local FREQ=$ (vcgencmd measure_clock arm)
 local TEMP=$ (vcgencmd measure_temp | tail -c 7)
 do
   echo "$(date) @ $(hostname)"

   # Shows the current frequency of the arm clock pre-stress test
   
   echo "Current frequency: $((FREQ / 1000))mhz" 
   $((FREQ / 1000)) > /home/$USER/Desktop/tester.txt
   
   # Shows the current temperature pre-stress test
   
   echo "Current temperature:$TEMP" 
   $TEMP > /home/$USER/Desktop/tester.txt


   echo "Perform new stress test..."


   # These stress test examples are commented out to get an idea of how to format the stress test for this script
   # stress --cpu $CORES --timeout $TIME > /home/$USER/Desktop/stress.log

   # stress --cpu 20 --io 20 --vm 6 --vm-bytes 25M --timeout 120s
   


   # The stress test will be logged to the "stress.log" everytime it executes
   # Duration of current stress test is: 120s (2mins) but can be changed to longer time frames
   
   stress --cpu 20 --timeout 120s > /home/$USER/Desktop/stress.log

 

   # Shows the current frequency of the arm clock post-stress test
   
   echo "Current frequency: $((FREQ / 1000))mhz" 
   $((FREQ / 1000)) > /home/$USER/Desktop/tester.txt
   
   # Shows the current temperature post-stress test
   
   echo "Current temperature:$TEMP"
   $TEMP > /home/$USER/Desktop/tester.txt

   
   esac  

done



