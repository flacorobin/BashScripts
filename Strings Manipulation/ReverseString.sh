#!/bin/bash
#Script that Reverses a string

while [[ -z $line ]]; do
echo -n "Script will reverse a string. Enter a string of text: "
read line
done

let line_len=`echo -n $line | wc -c`
#echo $line_len



for (( i=$line_len-1; i >= 0; i-- )); do
  echo -n ${line:$i:1}
done
