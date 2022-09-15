#!bin/bash
. /home/dev/scriptssh/Login_details.txt
if [ -z "$USERNAME" ] | [ -z "$HOSTS" ] | [ -z "$PASSWORD" ]
then 
	echo "username, Hosts and passwords are mandatory fields"
else
	sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no $USERNAME@$HOSTS exit
	if [ $? != 0 ]
	then 
		echo "Connection Failed!!! Either userName, Password or Hosts is/are wrong"
	else	
		echo "connection established successfuly..."
		SCRIPT="sudo sh /var/FilterData.sh"
		sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no $USERNAME@$HOSTS $SCRIPT
	fi
fi


