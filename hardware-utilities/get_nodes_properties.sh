#!/bin/bash
# get_nodes_properties.#!/usr/bin/env sh
# input is file with OOB IPs, and companion file is fr
# check for parameters, then IP gets response, then get properties one per line, for each node
user=$2
pw=$3
PROPERTIES_FILENAME=fru_properties.txt
if [ $# -lt 3 ]
then
  echo Format: get_nodes_properties \<file with OOB IPs\> \<node user\> \<password\>
  echo note: will look for these properites named in $PROPERTIES_FILENAME:
  echo -     $(cat $PROPERTIES_FILENAME)
  exit
fi
# $1 has OOB IP list file name
echo Collecting from nodes the properties in fru_properties.txt
echo $(cat fru_properties.txt)
echo
while read ip
do
  if [ "$(bash ../ip-utilities/Is_IP_in_use.sh $1)" = "0" ]
  then
    echo $1 does not respond to ping, can not reach for properties
    exit
  else
    echo $1 is alive and responding to ping
  fi
  while read key
  do
    # echo get_node_info $ip,\"$key\",bash get_fru_value.sh $ip \"$key\"
	  echo -- $key,$(bash get_fru_value.sh $ip "$key" $user $pw)
  done < fru_properties.txt
done < $1