#!/bin/bash
# get_node_properties <OOB IP>
# uses property list in file and IPMI interface to look up certain
# properties directly from the node
PROPERTIES_FILENAME=fru_properties.txt
ip=$1
user=$2
pw=$3
if [ $# -lt 1 ]
then
  echo Format: get_node_properties \<OOB IP\>
  echo note: will look for these properites named in $PROPERTIES_FILENAME:
  echo -     $(cat $PROPERTIES_FILENAME)
  exit
fi
if [ "$(bash ../ip-utilities/Is_IP_in_use.sh $1)" = "0" ]
then
  echo $1 does not respond to ping, can not reach for properties
  exit
else
  echo $1 is alive and responding to ping
fi
echo Collecting from node the properties in $PROPERTIES_FILENAME:
echo - $(cat $PROPERTIES_FILENAME)
echo
echo $ip
while read key
do
  # echo $1,\"$key\",bash get_fru_value.sh $ip \"$key\"
  echo - $key,$(bash get_fru_value.sh $ip "$key" $user $pw)
done < $PROPERTIES_FILENAME