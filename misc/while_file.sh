#!/bin/bash
# loop through /etc/passwd

num_PWs=1

read -p "How many lines?" num_wanted

while read PW
do
  # echo "$num_PWs": "$num_wanted"
  if [ $num_PWs -gt $num_wanted ] 
  then
    break
  else
    echo "$((num_PWs++))": "$PW"
  fi
done < /etc/passwd
