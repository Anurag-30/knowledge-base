APPUSER=appuser
HEADING(){
    echo -e "\e[33m$1\e[0m\n"
}

STATUS() {
    if [ $1 == 0 ]
     then
       echo -e "\e[32m $2 IS SUCCESSFUL\e[0m\n" 
     else
       echo -e "\e[31m $2 IS NOT SUCCESSFUL\e[0m\n" 
    fi  
}
HEADING "WEBSERVER-INSTALLATION"

yum install nginx -y &> /dev/null

STATUS $? "NGINX INSTALLATION"

systemctl enable nginx
 

STATUS $? "ENABLING NGINX SERVICE"

systemctl start nginx

STATUS $? "NGINX SERVICE START"

HEADING "APP SERVER INSTALLATION"

yum install java -y &> /dev/null

STATUS $? "JAVA INSTALLATION"

id $APPUSER &> /dev/null

if [ $? -ne 0 ]; then
  useradd $APPUSER
fi

STATUS $? "CREATING APP USER"

cd /home/$APPUSER
curl -s https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.49/bin/apache-tomcat-8.5.49.tar.gz | tar -xz

STATUS $? "DOWNLOADING TOMCAT"

chown $APPUSER:$APPUSER /home/$APPUSER -R 

curl -s https://raw.githubusercontent.com/Anurag-30/knowledge-base/master/01-shell%20scripting/tomcat.service -o /etc/systemd/system/tomcat.service

STATUS $? "STARTING TOMCAT"

HEADING "CONFIGURING WEB SERVER TO SERVER CONTENT OF APP SERVER"

 







