#!/bin/bash

# This function is used to transfer files from local to sftp directory
# Pass arguments as follows:
# Arugment 1 - username of the sftp user
# Argument 2 - ip address of the sftp server
# Argument 3 - Local directory of the file
# Argument 4 - File name with extension
# Argument 5 - Directory for file in sftp server

function sftp_file_transfer {

local SFTP_USER = $1
local SFTP_IP = $2
local LOCAL_FILE_DIR = $3
local LOCAL_FILE_NAME = $4
local SFTP_FILE_DIR = $5

sftp $SFTP_USER@$SFTP_IP << EOF
  lcd $LOCAL_FILE_DIR
  cd $SFTP_FILE_DIR
  put $LOCAL_FILE_DIR/$LOCAL_FILE_NAME
  chmod 666 $LOCAL_FILE_NAME
  bye
EOF

}