 #!/bin/bash

if [ "$1" ==  "" ]; then
   InputFile=./input.txt
else
   InputFile=$1
   echo $InputFile
fi

if [ "$2" == "" ]; then
   OutputFile=./output.txt
else
   OutputFile=$2
   echo $OutputFile
fi

cat $InputFile | sort -t';' -k2,2 -k1,1 -k3,3 -n > $OutputFile
cat $OutputFile
