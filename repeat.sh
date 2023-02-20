#!/usr/bin/bash
# Usage :
# 
# ./repeat.sh 3 "guess-wifi-password.sh" 
# Will repeat 3 times output from file "guess-wifi-password.sh"

for (( start = 1; start <= $1; start++ ))
do
  $2
done
