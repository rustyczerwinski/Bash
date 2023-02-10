#!/bin/bash
# get_fru_value.sh
# output is value for key provided
ip=$1
key=$2
user=$3
pw=$4
response=$(ipmitool -H $ip -I lanplus -U $user -P pw fru print | grep --word --max-count=1 "$key")
response=${response#*: }
# echo $ip,\"$key\",\"$response\"
echo $response
