#!/bin/bash
# get_nodes_properties_csv.#!/usr/bin/env sh
# input name for file with OOB IPs
# uses local file fru_properties.txt to list all FRU properties that are relevant
# check for parameters, that IP responds, then get properties
# output is IP and properties, one CSV line per IP
user=$2
pw=$3
if [ $# -lt 3 ]
then
  echo Format: get_node_properties \<file with OOB IPs\> \<username for nodes\> \<password\>
  exit
fi
# $1 has OOB IP list file name
echo Collecting from nodes the properties in fru_properties.txt
echo $(cat fru_properties.txt)
echo
while read ip
do
  properties=$ip
  while read key
  do
    # echo get_node_info $ip,\"$key\",bash get_fru_value.sh $ip \"$key\"
    properties=$properties,$key,$(bash get_fru_value.sh $ip "$key" $user $pw)
  done < fru_properties.txt
  echo $properties
done < $1