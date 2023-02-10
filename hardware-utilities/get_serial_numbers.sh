#!/bin/bash
# get_serial_numbers.sh
# update below with IPs
# output is IP<space><serial>
user=$
pw=$
#for i in $(echo 10.117.{6.120,5.67,7.251});
for i in $(echo 10.117.8.{149..152});
do
	echo "$i $(ipmitool -H $i -I lanplus -U $user -P $pw fru print | grep 'Product Serial')"
done
