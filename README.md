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
Rationalefor proposed solution

I decided to use BASH to program Car rental project. 
### Success Criteria
These are measurable outcomes
1. A car can be created and stored in the database.
1. A car information can be edited.
1. A car can be deleted from the database be recorded ad stored for an existing car.
1. The installation is ***simple-> one step provess***.
1. A summary (total/average distance traveled) can be generated for a particular car.
1. Trips can be recorded ad stored for an existing car.
1. A basic daravase system is implemented.
1. A basic backup functionality is available.

Design
---------

Development
--------
**Create**

1. Get inputs
2. Check # for arguments ex.) 
   ***if 4 then continue, if not exit "message"***
3. Write to main file with one extra line. Not erasing other entries.
4. Create car trip file with License plate.txt

Evaluation
-----------
Test 1:
The first run of the test file was unsuccessfull because the Database folfer was not existent.
Also the create program did not store the license file inside the Database folder. Changing the line 'echo " " > Database/$license.txt'. Solved this issue.

Second run of the program we had one issue: the test file needed to move to the main folder '''.sh
cd ../
'''
This is necessary because the 'create.sh' resides in the main folder wheread the test file is inside the /tests folders.


lastline = $( tail -n 1 Database/maincarfile.txt )
This code demonstrates the last line of the maincarfile.txt which is the most resent line that are added.
This is to check that the car was successfully added in main file or not.

**Summary:**
