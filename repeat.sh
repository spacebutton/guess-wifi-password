#!/usr/bin/bash
# Usage :
# 
# ./repeat.sh 3 "hello.sh" 
# Will repeat 3 times output from file "hello.sh"

for (( start = 1; start <= $1; start++ ))
do
  $2
done
