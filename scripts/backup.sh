#!/bin/bash

#Automated backup system

#Name of the files or folders to take Backup
backup_files="/"

#Destination of Backup.
dest="~/Desktop/carrentalapp/Database"

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
