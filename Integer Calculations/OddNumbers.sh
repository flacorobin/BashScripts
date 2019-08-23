#!/usr/bin/env bash
#Your task is to use for loops to display only odd natural numbers from  1 to 99.
for (( i = 1; i < 99; i++ )); do
  if [[ $i%2 -eq 1 ]]; then
    echo "$i"
  fi
done
