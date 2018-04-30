#!/bin/bash

echo "****************************************************************"
echo "For Debugging (print env. variables, define command tracing)"
echo "****************************************************************"
#set -o xtrace
#env
#set

# Update packages and Upgrade system
echo "****************************************************************"
echo "Updating System"
echo "****************************************************************"
apt-get update -y


echo "****************************************************************"
echo "Installing Apache"
echo "****************************************************************"
apt-get install apache2 apache2-utils -y
systemctl enable apache2
systemctl start apache2
apt-get install libapache2-mod-wsgi

echo "****************************************************************"
echo "Installing Flask"
echo "****************************************************************"
apt-get install python-pip
pip install flask


echo "****************************************************************"
echo "Installing Flask App"
echo "****************************************************************"
git clone https://github.com/nahumtimerman/flask_app
sed -i -e '/DocumentRoot \/var\/www\/html/ r flask_app/scripts/conf_changes' /etc/apache2/sites-enabled/000-default.conf

systemctl restart apache2.service

