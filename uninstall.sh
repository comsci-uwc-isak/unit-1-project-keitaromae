#!/bin/bash

#This program uninstalls the application
echo "Are you sure you want to uninstalls CarRentalApp? press y:Yes or n:No"
read ans
if [ $ans == y ]; then
  echo "Uninstalling file.."
  rm -r ~/Desktop/carrentalapp/
  echo "Uninstalled succesfully."
else
  echo "The file is not uninstalled."
  exit
fi

