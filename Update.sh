Nalani Daniels
August 30, 2023

Purpose:
Create a script called buildscript1.sh that updates the server, creates a file that indicates how many packages can be upgraded, and saves that output to a file titled 'update$date.txt'

Script:
#Indicate this file is a bash script
#!/bin/bash

#Updates the server's repository, then uses the grep command to find where the output specifies how many packages can be upgraded. The cut command simply carves out the relevant information, and then the output is redirected to a file with the date.
sudo apt update | grep "upgraded" | cut -f 1 -d "." > update$(date +"%m.%d.%Y").txt

Changing Permissions
chmod 700 buildscript1.sh

Setting Up Cronjob
#Open the cronjob file for my user ubuntu
sudo crontab -e

#Input job to run script every Friday at 11PM
0 23 * * 5 ./buildscript1.sh
