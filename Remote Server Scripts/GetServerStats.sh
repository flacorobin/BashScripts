#!/usr/bin/env bash
#Script that connects to a remote Mac server and retrieves Uptime, CPU Info, Mem usage and Network addresses stats


if [ $# -eq 0 ]; then
  Username=lantec #Default username to minimize input but on future version can be put as a input variable
  Server_Name=10.65.58.98   #Default Server to minimize input but on future version can be put as a input variable
else
  Username=`echo $1 | cut -d "@" -f 1`
  Server_Name=`echo $1 | cut -d "@" -f 2`
fi


output=$(ssh $Username@$Server_Name /bin/bash << "ENDSSH"  #The "ENDSSH"...ENDSSH block is a HEREDOC multi-line string. The quotes around the first ENDSSH marker tell bash you don't want it to perform variable expansion within the block.
echo "Uptime"
uptime
echo "CPU info"
sysctl -n machdep.cpu.brand_string
echo "Memory Usage"
top -l 1 -s 0 | grep PhysMem
echo "Disk Free Information"
df -h
echo "Network Addresses"
ifconfig | grep inet
ENDSSH
)

#Display Results
echo "$output"
