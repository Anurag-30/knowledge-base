HEADING(){
    echo -e "\e[33m$1\e[0m\n"
}

STATUS() {
    if [ $? == 0 ]
     then
       echo "$1 
}
HEADING "WEBSERVER-INSTALLATION"

yum install nginx -y &> /var/log/app.log

