#!/bin/bash

read -p "user id: " user

host=52.91.165.231

ssh -i "/Users/apple/Downloads/vijayshellscript/tominstall.pem" $user@$host 'p=$(ps -ef | grep tomcat | grep Djava.util.logging.config.file | grep -v grep | awk "{print \$2}"); echo $p; 

if [ -z $p ]

then

    echo "tomcat instance is not running"

    echo "starting tomcat:"

    echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "startup.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

elif [ -n $p ]

then 

    echo "restarting the tomcat instance"

    echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "shutdown.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

    echo myPassword | sudo -S su - tomcat -c "find /opt/ /u01/ /webdata/ -name "startup.sh" -type f -exec {} \; 2>&1 | grep -v "No such file or directory""

else

    echo "Looks like tomcat not installed"

fi

'
