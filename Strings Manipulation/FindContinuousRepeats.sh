#!/usr/bin/env bash

echo "Script that finds continuous repeats on a string."
echo -n "Enter string:"
read line
array=($line) #passes the string into an array
len=${#array[@]} #gets array length
let count_repeats=0

for (( i = 0; i < len - 1; i++ )); do
  if [[ ${array[i]} == ${array[i+1]} ]]; then
    let count_repeats=count_repeats+1
  fi
done

echo "Found $count_repeats continuous repeats"
