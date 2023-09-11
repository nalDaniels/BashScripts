# Nalani Daniels 
# September 6, 2023 

# Purpose:
# To initiate a ssh session between a local and remote server. Also, to have an option to scp files to from a local server to a remote server and from a remote server to a local server

#!/bin/bash

#First create a key-pair on local server. Then copy the key from ~/.ssh/id_rsa.pub to the ~/.ssh/authorized_keys file on the remot>

#Provide a menu to user to select ssh or scp
echo "Select ssh or scp"
select sessiontype in ssh scp
do
        #create a case statement that executes commands based on the case selected
        case $sessiontype in
                #If you selected ssh, then
                "ssh"  )
                        echo "You selected ssh"
                        read -p "Enter the username of the remote server: " username
                        read -p "Enter the remote server's IP Address: " IPAddress
                        ssh $username@$IPAddress ;;
                #If you selected scp, then
                "scp" )
                        echo "You selected scp."
                        read -p "Enter the username of the remote server: " username
                        read -p "Enter the IP Address of the remote server: " IPAddress
                        echo "Enter the scp direction: "
                        select direction in remotetolocal localtoremote     
                                do
                                        #Create a case statement for each case - remote to local and local to remote
                                        case $direction in
                                                #Create a keypair on the remote server, then copy it to the local server's authorized_keys
                                                #Run these commands from your local server
                                                "remotetolocal" )
                                                        read -p "Enter remote source of file: " source
                                                        read -p "Enter local destination for file: " destination    
                                                       #If you add a name to the destination variable it will rename the copied
                                                       #file. If you do not, it will use the source filename. 
                                                         scp $username@$IPAddress:$source $destination ;;
                                                "localtoremote" )
                                                        read -p "Enter local source of file: " source
                                                        read -p "Enter remote destination for file folder: " destination   
                                                       #If you add a name to the destination variable it will rename the copied
                                                       #file. If you do not, it will use the source name
                                                         scp $source $username@$IPAddress:$destination ;;
                                                * )
                                                        echo "Please choose remotetolocal or localtoremote" ;;

                                        esac
                                done ;;
                * )
                        echo "Please select ssh or scp" ;;

        esac
done
 #Use Ctrl C to break out of statement
