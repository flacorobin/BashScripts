#!/usr/bin/env bash
#Prints the Fibonacci sequence up to Nth digit using Bash. Saves on array, displays the array.

declare -a Fibonacci_array=(0 1 1)
declare -i limit

echo -n "This script prints the Fibonacci sequence. Choose limit: "
read limit


i=1
while [[ ${Fibonacci_array[i]} -le $limit ]]; do
  #echo ${Fibonacci_array[i]} $limit
  let Fibonacci_array[i+1]=${Fibonacci_array[i]}+${Fibonacci_array[i-1]}  
  let i=$i+1
done

for (( i = 0; i < ${#Fibonacci_array[@]}-1 ; i++ )); do
  echo -n "${Fibonacci_array[i]} "
done

echo
