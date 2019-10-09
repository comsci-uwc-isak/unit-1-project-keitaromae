![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
**Defining the Problem (Topic 1.1.1)**

We are creating some project for rental car shop that can make entire check in and check out process more smooth and seamless. First of all, moving all the data and systems inside our application, so they can keep everything in one place.
This app memorizes all the car types, date and mileage. It is easier for the owner to keep everything in touch. 
Planning to make some application system with really easy installation. Since the rental shop's owner are not feeling confident with all the techy things, this app can be easily installed by attaching USB disks. After that, just activate our program inside and do all the process to execute the work.

### Definition of problem

### Solution proposed
I decided to use BASH to program Car rental project.
It is more simple to both code and execute by using bash program.

### Success Criteria
These are measurable outcomes
1. A car can be created and stored in the database.
1. A car information can be edited.
1. A car can be deleted from the database be recorded ad stored for an existing car.
1. The installation is ***simple-> one step process***.
1. A summary (total/average distance traveled) can be generated for a particular car.
1. Trips can be recorded ad stored for an existing car.
1. A basic daravase system is implemented.
1. A basic backup functionality is available.

Design
---------

Development
--------
***Install program***

```sh
#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "Starting the installation"
echo "Default install path is /Desktop/"
echo "Press Enter to continue installation"
echo "press x to change the installation path"

read choice

#checking what user eneted
if [[ ($choice == x) ]];then
    echo "Enter installation path, then press Enter"
    read path

    #movih to the desired location
    cd $path
    echo "moving to $path"

else
  #moving to default location
  cd /Desktop
fi

#Create App folder
mkdir carrentalapp

#move to created folder
cd carrentalapp

#create for database and scripts
mkdir Database
mkdir scripts

echo "structure created successfully"
```

***Backup system***
```sh
#!/bin/bash

#Automated backup system

#Name of the files or folders to take Backup
backup_files="/"

#Destination of Backup.
dest="/"

#Create archive file name
day=$(date +%Y-%m-%d)
hostname=$(hostname -s)
archive_file="$hostname-$day.tar.gz"

#Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

#Backup the files using tar.
tar czf $dest/$archive_file $backup_files

#Print end status message.
echo
echo "Backup finished"
date

#Long listing of files in $dest to check file sizes
ls -1h $dest

chmod 755 backup.sh
```
***Create***
1. Get inputs
2. Check # for arguments ex.) 
   ***if 4 then continue, if not exit "message"***
3. Write to main file with one extra line. Not erasing other entries.
4. Create car trip file with License plate.txt
```sh
#!/bin/bash

#This program let the user to type information in, and it will automatically write it down
#to the file maincarfile.txt

if [ $# -ne 4 ]; then
	echo "Wrong input. Please enter Plate, Model, Color and Passengers"
	exit
fi

#Number of arguments is correct. Continue
plate=$1
model=$2
color=$3
PP=$4

#Adding new entry to file maincarfile.txt
echo "$plate $model $color $PP" >> maincarfile.txt

bash frame "Car created successfully"
```
***Record***

***Frame***
```sh
#!/bin/bash

#This is the program that creates some frame around the word user type in

word=$1
len=${#word}


for (( i=0; i<100; i++ ))
	do
		echo -n "*"
	done

echo " "


echo -n "*"
for (( i=0; i<98; i++ ))
	do
		echo -n " "
	done
echo "*"


echo -n "*"
echo $word

for (( i=0; i<98; i++ ))
	do
		echo -n " "
	done
echo "*"


echo -n "*"
for (( i=0; i<98; i++ ))
	do
		echo -n " "
	done
echo "*"


for (( i=0; i<100; i++ ))
	do
		echo -n "*"
	done

```
***Summary***
```sh
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
```
Evaluation
-----------
Test 1:
The first run of the test file was unsuccessfull because the Database folfer was not existent.
Also the create program did not store the license file inside the Database folder. Changing the line 'echo " " > Database/$license.txt'. Solved this issue.

Second run of the program we had one issue: the test file needed to move to the main folder 
```sh
cd ../
```
This is necessary because the 'create.sh' resides in the main folder wheread the test file is inside the /tests folders.


```sh 
lastline = $( tail -n 1 Database/maincarfile.txt )
```
This code demonstrates the last line of the maincarfile.txt which is the most resent line that are added.
This is to check that the car was successfully added in main file or not.

Test 2: Everything worked fine

```sh
#!/bin/bash

#This file test the first success criterion, namely,
#A car can be created and stored in the database

#step1: create a car using the script create
bash ../create TXM301 issan red 9

#step 2: check that the livense file.txt was created
if [ -f "../Database/TXM301.txt" ]; then
	echo "test one: a txt file was created inside the database: passed"

else
	echo "test one: Error, file not found: not passed"
fi

#step 3: Check that the car was added to the main file
cat Database/maincarfile.txt
lastline=$( tail -n 1 Database/maincarfile.txt )
if [ "TXM301 nissan Red 9" == $lastline ]; then
	echo "Test two: Record was entered correctly: Passed"
else
	echo "Test two: Failed"
fi

```
**Summary:** We did sturctural testing a.k.a White-box testing, dynamic testing and alpha testing. White-box testing is the test method that looks inside the software that is being tested and used that knowledge as part of its testing process. 
Dynamic testing takes place when the program is run. It can be done by executing software.
Alpha test is done by developer itself. On the other hand, Beta is the version that customer can actually touch and feel the product.
