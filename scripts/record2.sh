#!/bin/bash

#This program records license plate, Km, datein, dateout

if [ $# -ne 4 ]; then
	echo "please enter license, km, datein, dateout"
	exit
fi

plate=$1
km=$2
datein=$3
dateout=$4

echo "$km, $datein, $dateout" >> ../Database/$plate.txt

bash frame5 "data has been stored correctly"

