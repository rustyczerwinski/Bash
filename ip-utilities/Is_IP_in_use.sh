#!/bin/bash
# Is_IP_in_use.sh
# check via ping whether IP is in use (1) or not (0)
# input is to IP address
# output is 1 yes; 0 no
host=$1
log="IP_check.log"
echo "host: $host; ping status: $(ping $host -c 1 -w 1 | grep '1 received' | wc -w )" >> $log
if [ $(ping $host -c 1 -w 1 | grep '1 received' | wc -w ) -gt 0 ]
then
  echo 1
else
  echo 0
fi
