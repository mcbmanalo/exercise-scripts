#!/bin/bash

echo "Please enter username of linux user"
read user # Take username of user for directory, user, and group

sudo cp -R /var/log /home/$user/log_files # Copy files to log_files folder
sudo chown -R $user:$user /home/$user/log_files # Change ownership and group of every file

find /home/$user/log_files -name *.log > /home/$user/log_files/list_of_logs.txt # Look for .log files and put it into a .txt file
log_files=( $(cat /home/$user/log_files/list_of_logs.txt) ) # Take contents of .txt file
current_dir= pwd # Take current working directory of user

for x in ${log_files[@]}
do
	wc -lc $x >> /home/$user/log_files/logs_summary.txt # Append output of command to logs_summary.txt
done

sudo tar cvfz logs_archive.tar.gz /home/$user/log_files
sudo cp $(pwd)/logs_archive.tar.gz /opt/
sudo chmod 555 /opt/logs_archive.tar.gz
