#!/bin/bash
case $1 in
  start)
    /tmp/sleepwalkingserver &
    ;;
  stop)
    kill $(cat /tmp/sleepwalkingserver.pid)
    ;;
  *)
    echo usage:  sleepwalking start/stop
    echo received: received: sleepwalking "$1"    
    ;;
esac
