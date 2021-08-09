#!/bin/bash
# Are_these_IPs_in_use.sh
# take IPs as input parameters and check via ping whether IPs are in use (1) or not (0)
for IP in $@
do
  res=$(bash Is_IP_in_use.sh $IP) 
  if [ "$res" == "0" ]
  then
    echo "$IP not in use/not responding"
  else
    echo "$IP in use/responding"
  fi
done
