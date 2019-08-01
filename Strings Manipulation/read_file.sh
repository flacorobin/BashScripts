#!/bin/bash
#Script reads from a file in 2 different ways

if [ $# -eq 0 ]; then
   myFile=./logs.lst
else
   myFile=$1
fi


echo "Reading file with 'for'"
for i in `cat $myFile`; do
    server=`echo $i | cut -d "|" -f 1`
    logs=`echo $i | cut -d "|" -f 2`
    echo $server
    echo $logs
done

echo ""

echo "Reading file with 'while'"
while IFS= read -r line
do
  server=`echo $line | cut -d "|" -f 1`
  logs=`echo $line | cut -d "|" -f 2`
  echo $server
  echo $logs
  echo $line
done < "$myFile"
