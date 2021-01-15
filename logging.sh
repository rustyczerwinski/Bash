#!/bin/bash
num=$RANDOM
function logit() {
  echo message is "$1"
  logger -p user.info -t lograndom -i "$1"
}

logit "$num"
