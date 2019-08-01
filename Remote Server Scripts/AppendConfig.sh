#!/usr/bin/env bash

#This script appends a line in a config file on a list of servers.
#Inputs are: file with list of servers IP/DNS Names, Path of the Config file to be modified ($Path_Config), and Line to add ($Line_Add)
#Script will read from a file line by line with the following format Server_IP|Path_Config, I.E.: 127.0.0.1|/path/to/config/file. File is first parameter of the Script, if none is specified it will read ./Serverlist.lst
#Line_add will be read from keyboard Input

Username=lantec #Default username to minimize input but on future version can be put as a input variable

if [ $# -eq 0 ]; then
   list=./ServerList.lst
else
   list=$1
fi


Line_Correct=false
while [ $Line_Correct = false ]; do
echo -n "Input the line to be appended to the Servers:"
read Line_Add
echo "Line to be added:"
echo $Line_Add
echo "Is this line correct?[Y/N]"
read response
  case $response in
    [yY][eE][sS]|[yY])
      Line_Correct=true
      ;;
    *)
      Line_Correct=false
      ;;
  esac
done



for i in `cat $list`; do
    Server_Name=`echo $i | cut -d "|" -f 1`
    Path_Config=`echo $i | cut -d "|" -f 2`
    echo $Line_Add | ssh $Username@$Server_Name "cat >> $Path_Config"
    echo "$Server_Name Patched."
done
