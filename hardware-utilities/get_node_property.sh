#!/bin/bash
# get_node_property.sh
# take in value for key and file with IP list
# output echo CSV IP, key, value
key=$1
file=$2
user=$3
pw=$4
while read ip
do
	echo $ip,\"$key\",$(bash get_fru_value.sh $ip "$key" $user $pw)
done < $2
