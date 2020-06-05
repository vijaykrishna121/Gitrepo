#!/bin/bash
  
#tomdir=/opt/tomcat/apache-tomcat-9.0.35/bin

tomdir=$1

read -p 'userid: ' user

for server in $(cat serverlist.txt)

do

    ssh -i "/Users/apple/Downloads/shell.pem" $user@$server "cd $tomdir; ./version.sh"

done
