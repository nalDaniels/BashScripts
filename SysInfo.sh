#!/bin/bash

#Create a menu to display system information 
echo "System Information Menu. Choose 1-13"
select option in "Current Logged User" "Your Shell Directory" "Home Directory" "OS Name & Version" "Current Working Directory" "Number of Users Logged In" "Hard Disk Information" "CPU Information" "Memory Information" "File System Information" "Current Running Process" "Exit"
do
  #Create a case statement that executes commands based on system information menu selection
  case $option in
    "Current Logged User" )
  


