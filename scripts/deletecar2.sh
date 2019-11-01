#!/bin/bash
#This program is for deleting a single car file
#moving to database file
cd ../db/
#check that argument was provided
#get argument of plate and check if it exits and delete the car file
plate=$1
if [[ ($# -ne 1) ]];then
	echo "Input is wrong, please type Plate again"
elif [ ! -f "$1.txt" ];then
	echo "The file don't exis. Please try again"
else 
	rm $1.txt
	bash frame5 "The file was successfully deleted"
	#delete whole line which includes the plate
	sed -i '' "/$1/d" maincarfile.txt
	bash frame5 "The car information was successfully deleted"
fi
exit 
