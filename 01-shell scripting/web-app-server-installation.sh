HEADING(){
    echo -e "\e[33m$1\e[0m\n"
}

STATUS() {
    if [ $? == 0 ]
     then
       echo -e "$1 \e[32m INSTALLATION IS SUCCESSFUL\e[0m\n" 
     else
       echo -e "$1 \e[31m INSTALLATION IS NOT SUCCESSFUL\e[0m\n" 
    fi  
}
HEADING "WEBSERVER-INSTALLATION"

yum install nginx -y &> /dev/null

STATUS WEBSERVER

