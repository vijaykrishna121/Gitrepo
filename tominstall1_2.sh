#!/bin/bash

#Author by Vemuru Vijay Kumar

echo "Provide the user to do ssh"

read -p "user id: " user

#tomcat file

tomfile=$1

tomuser="tomcat"

for server in $(cat serverlist.txt)

do

   read -p "Are you sure you want to continue installing tomcat on '$server' (opt/u01/webdata)? " tominstalldir

   if [[ $tominstalldir -eq opt || $tominstalldir -eq u01 || $tominstalldir -eq webdata ]]

   then

       for host in $(cat serverlist.txt)

       do 

       sudo scp -i "/Users/apple/Downloads/vijayshellscript/tominstall.pem" $tomfile $user@$host:/tmp; 
       
       ssh -i "/Users/apple/Downloads/vijayshellscript/tominstall.pem" $user@$host 'sudo mkdir -p /'$tominstalldir'/mw/; 

       sudo tar -xzvf /tmp/'$tomfile' -C /tmp/;  

       sudo cp -r /tmp/apache* /'$tominstalldir'/mw/; 

       sudo chown -R tomcat:tomcat /'$tominstalldir'/mw/;

       sudo chmod -R 774 /'$tominstalldir'/mw/; 

       sudo yum install java; 

       sudo rm -rf /tmp/apache-*;' 'p=$(ps -ef | grep tomcat | grep Djava.util.logging.config.file | grep -v grep | awk "{print \$2}"); 

       echo $p;

       if [ -z $p ]; then

                        echo "tomcat instance is not running"

                        echo "starting tomcat:"

                        echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "startup.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

       elif [ -n $p ]; then

                         echo "restarting the tomcat instance"

                         echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "shutdown.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

                         echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "startup.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

       else

          echo "Looks like tomcat not installed"

       fi

'

       done

   fi

done
