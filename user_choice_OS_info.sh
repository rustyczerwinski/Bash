#!/bin/bash

function get_user_choice() {
  echo 1: disk usage > /dev/tty
  echo 2: uptime > /dev/tty
  echo 3: who is on > /dev/tty
  echo q: quit > /dev/tty

  while true
  do
    read -p "Which would you like to do? " CHOICE
    case "$CHOICE" in
      [123q])
        break
        ;;
      *)
        echo invalid choice, try again > /dev/tty
        continue
        ;;
    esac
 done
 echo $CHOICE
 exit 0
}

c=0
clear
while [ "$c" != "q" ]
do 
  c=$(get_user_choice)
  clear
  echo "***** executing $c ******************"
  case $c in
  1)
    echo disk usage:
    sleep 2
    df | more
    ;;
  2)
    echo uptime:
    uptime
    ;;
  3)
    echo who is here ?
    who
    ;;
  q)
    echo Thanks for playing :\) 
    break
    ;;
  *)
    echo "should not get here\!"
    break
  esac
  echo "*************************************"
done  

