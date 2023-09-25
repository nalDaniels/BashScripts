#Purpose:
#To create a menu that provides system information based on the option selected

#!/bin/bash

#Change the prompt
PS3="Choose your option: "

#Create a menu to display system information
echo "System Information Menu. Choose 1-13"
select option in "Current Logged User" "Your Shell Directory" "Home Directory" "OS Name & Version" "Current Working Directory" "Number of Users Logged In" "Hard Disk Information" "CPU Information" "Memory Information" "File System Information" "Current Running Processes" "Exit"
do
  #Create a case statement that executes commands based on system information menu selection
    case $option in
        "Current Logged User" )
                echo "The current logged in user is "
                whoami ;;
        "Your Shell Directory" )
                echo "The shell directory is "
                echo $SHELL ;;
        "Home Directory" )
                echo "The home directory is "
                echo $HOME ;;
        "OS Name & Version" )
                echo "The OS name and version is: "
                cat /etc/os-release | grep "PRETTY_NAME" | cut -f 2 -d "=" ;;
        "Current Working Directory" )
                echo "The current working directory is "
                pwd ;;
        "Number of Users Logged In" )
                echo "The number of users logged in is "
                who | wc -l ;;
        "Hard Disk Information" )
                read -rp "Enter the directory of the contents or the file you want hard disk                 information for: " directoryorfile 
                du -h $directoryorfile ;;
        "CPU Information" )
                echo "Here is information about the CPU"
                lscpu ;;
        "Memory Information" )
                echo "Here is information about the RAM"
                free -h ;;
        "File System Information" )
                echo "Here is information about the file system: "
                df -ah ;;
        "Current Running Processes" )
                echo "The current processes running are: "
                ps -aux ;;
        "Exit" )
                break ;;
        * )
                echo "Invalid selection. Choose 1-12"
        esac
done
