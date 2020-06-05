#!/bin/bash

read -p "user id: " user

tominstalldir="/opt/tomcat/"

tomfile=$1

tomuser="tomcat"

if [ $# -eq 1 ]

then

    for host in $(cat serverlist.txt)

     do 

sudo scp -i "/Users/apple/Downloads/vijayshellscript/tominstall.pem" $tomfile $user@$host:/tmp; 

ssh -i "/Users/apple/Downloads/vijayshellscript/tominstall.pem" $user@$host 'sudo mkdir -p '$tominstalldir'; 

sudo tar -xzvf /tmp/'$tomfile' -C /tmp/; 

sudo rm -rf /tmp/apache*.tar.gz;

sudo cp -r /tmp/apache* '$tominstalldir'; 

sudo chown -R tomcat:tomcat '$tominstalldir'; 

sudo yum install java; 

echo myPassword | sudo -S su - tomcat -c "find /opt/ -name "startup.sh" -type f -exec {} \;"' 

    done

fi
