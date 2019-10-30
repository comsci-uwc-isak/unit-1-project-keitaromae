#!/bin/bash

#This program will backup the entirity of the database folder within the carrentalapp.

location=$1

if [[ $# -ne 1 ]]; then
	echo "Sorry, there was an error with backing up your files."
	exit
else
	cp -a /Users/keitaromae/Desktop/carrentalapp/Database $location
	echo "Successfully backed up into $location."
fi
