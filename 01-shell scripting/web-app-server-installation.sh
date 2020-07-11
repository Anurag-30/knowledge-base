HEADING(){
    echo -e "\e[33m$1\e[0m\n"
}

STATUS() {
    if [ $? == 0 ]
     then
       echo -e "\e[32m $1 IS SUCCESSFUL\e[0m\n" 
     else
       echo -e "\e[31m $1 IS NOT SUCCESSFUL\e[0m\n" 
    fi  
}
HEADING "WEBSERVER-INSTALLATION"

yum install nginx -y &> /dev/null

STATUS "WEBSERVER INSTALLATION"

systemctl start nginx

STATUS "NGINX SERVICE START"

