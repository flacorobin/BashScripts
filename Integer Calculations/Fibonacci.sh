#!/bin/bash
#Prints the Fibonacci sequence up to Nth digit using Bash. Saves on array, displays the array.
#If scripts has an argument it uses the argument to calculate. If not it will ask interactively for a limit number

declare -a Fibonacci_array=(0 1 1)
declare -i limit

request_limit=false

if [ $# -eq 0 ]; then
   request_limit=true
else
   limit=$1
fi


if [[ $request_limit == true ]]; then
  echo -n "This script prints the Fibonacci sequence. Choose limit: "
  read limit
fi

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
