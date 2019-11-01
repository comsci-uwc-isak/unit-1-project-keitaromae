#!/bin/bash

#This script generates summary for a given car
bash frame5 Summary

#step 1: check the number of arguments
if [ $# -ne 1 ];then
  echo "Enter a licence"
  exit
fi

#step 2: checking the file exist in the database
cd ../Database/
FILE=$1
if [ ! -f "$FILE.txt" ];then
  echo "File for car $FILE does not exist. Starting summary"
  exit
fi

#step 3: calculate the total km
total=0
while read line;
do
  for km in $line
  do
    (( total=$total+$km))
    break
  done
done < "$FILE.txt"

#step 4: show result nicely.
cd ../scripts/
bash frame5 "total distance traveled for $FILE was $total"
exit