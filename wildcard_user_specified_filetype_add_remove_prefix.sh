#!/bin/bash
# rename files with prefix, based on user input for both.  
# input command line args (both optional, will prompt user): 
#   1) file pattern
#   2) prefix

# default prefix is date formatted to YYMMDD
default_prefix="$(date +%Y%m%d)"

prefix_add=0
# function to count files that match input pattern
function file_count() {
  local NUM_FILES=0  
  for FILE in $(ls $1)
  do
    NUM_FILES=$((++NUM_FILES))
  done
  return $NUM_FILES
}

# first get input parameter for files to check

echo num args "$#"
echo prefix_add "$prefix_add"
if [ "$3" == "remove" ] || [ "$3" == "REMOVE" ]
then
  echo will remove prefix 
  prefix_add=-1
else
  prefix_add=0
fi
echo prefix_add "$prefix_add"
  
if [ $# -gt 1 ]
then
  prefix="$2"
else
  read -p "Enter text to prepend to file names:" prefix
  if [[ -z $prefix ]]
  then
    # default is date prefix YYMMDD
    prefix="$default_date_prefix"
  fi
fi
if [ $# -eq 1 ]
then
  files_to_check="$1"
else
  read -p "Enter pattern to select files to rename (e.g. *.log)" files_to_check
  if [[ -z $files_to_check ]]
  then
    echo No file pattern provided, exiting
    exit -1
  fi
fi

echo Looking for "$files_to_check" to rename by prepending "$prefix" ...
# show user all the qualifying files
echo files that match input filter "$files_to_check":
ls $files_to_check

# check if any qualifying files - if not, exit
file_count "$files_to_check"; fc=$? 
if [[ fc -gt 0 ]] 
then
  echo Checking "$fc" files...
  # file count > 0 so at least one qualifying file
  for fn in $(ls $files_to_check)
  do
    # check whether each file already has prefix
    if [[ $fn == "$prefix"* ]]
    then
      if [ $prefix_add == 0 ]
      then 
        echo skipping, already has prefix: $fn
      else 
    else
      fnnew=$prefix$fn
      echo renaming "$fn" to "$fnnew"
      # mv $fn $fnnew
    fi
  done
  # there was at least one, so show user net impact
    echo files that now match input filter "$files_to_check":
    ls $files_to_check

else
  echo no files found: "$files_to_check"
fi
