#!/bin/bash
# Find_IPs_not_in_use.sh
# Start with range of IPs, check each and list/output only those not in use
# Input is IP set
# Find_IPs_not_in_use.sh 10.117.3.{0 127}
cnt=0
cntFound=0
for IP in $@
do
  cnt=$((++cnt))
  res=$(bash Is_IP_in_use.sh $IP) 
  if [ "$res" == "0" ]
  then
    echo "$IP not in use/not responding"
    cntFound=$((++cntFound))
  fi
done
echo $cnt IPs checked, $cntFound not in use.
