#!/bin/bash
# Which_of_these_IPs_not_in_use.sh
# Start with range of IPs, check each and list/output only those not in use
cnt=0
for IP in $@
do
  cnt=$((++cnt))
  res=$(bash Is_IP_in_use.sh $IP) 
  if [ "$res" == "1" ]
  then
    echo "$IP in use/responding"
  fi
done
echo $cnt IPs checked.