#!/usr/bin/env bash

#This script replace a string in a config file on a list of servers.
#Inputs are: file with list of servers IP/DNS Names, Path of the Config file to be modified ($Path_Config), and string to replace and string being replaced.
#Script will read from a file line by line with the following format Server_IP|Path_Config, I.E.: 127.0.0.1|/path/to/config/file. ServerList is first parameter of the Script, if none is specified it will read ./Serverlist.lst
#Original_String and Replace_String will be read from keyboard Input

Username=lantec #Default username to minimize input but on future version can be put as a input variable


if [ $# -eq 0 ]; then
   list=./ServerList.lst
else
   list=$1
fi


Original_String_response=false
Replace_String_response=false

result=false
function confirm {
  read response
    case $response in
      [yY][eE][sS]|[yY])
        result=true
        ;;
      *)
        result=false
        ;;
    esac
}


while [ $Original_String_response = false ]; do
echo -n "Enter string to be replaced:"
read Original_String
echo "Is this line correct?[Y/N]"
confirm
Original_String_response=$result
done

return=false
while [ $Replace_String_response = false ]; do
echo "Enter string to replace with:"
read Replace_String
echo "Is this line correct?[Y/N]"
confirm
Replace_String_response=$result
done

for i in `cat $list`; do
    Server_Name=`echo $i | cut -d "|" -f 1`
    Path_File_Config=`echo $i | cut -d "|" -f 2`
    File_Config=$(basename $Path_File_Config)
    Path_Config=$(dirname $Path_File_Config)

#    ssh $Username@$Server_Name "sed -i \"\" 's/$Original_String/$Replace_String/' $Path_File_Config"

    output=$(ssh $Username@$Server_Name /bin/bash << ENDSSH  #The "ENDSSH"...ENDSSH block is a HEREDOC multi-line string. The quotes around the first ENDSSH marker tell bash you don't want it to perform variable expansion within the block.
    sed -i \"\" 's/$Original_String/$Replace_String/' $Path_File_Config
    hostname
    cat $Path_File_Config
ENDSSH
    )


    echo $output
done
