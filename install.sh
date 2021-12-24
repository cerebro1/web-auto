#!/bin/bash
sudo apt-get update -y
sudo apt-get install python3 -y
sudo apt install git -y
#sudo apt -t buster-backports install tmux -y
sudo apt-get install python3-pip -y
sudo pip3 install django
sudo apt install apache2 -y
sudo apt install libapache2-mod-wsgi-py3 -y
sudo a2enmod wsgi
sudo systemctl reload apache2
git clone https://github.com/datadewins/djando-demo.git
sudo cp -r djando-demo/dynamic /var/www/html
sudo chown www-data /var/www/html/dynamic -R
echo 'WSGIScriptAlias / /var/www/html/dynamic/dynamic/wsgi.py
WSGIPythonPath /var/www/html/dynamic/
<Directory /var/www/html/dynamic/>
   <Files wsgi.py>
      Order deny,allow
      Allow from all
   </Files>
</Directory>' >> sudo tee -a /etc/apache2/sites-enabled/000-default.conf
sudo apache2ctl configtest
sudo systemctl reload apache2
sudo systemctl restart apache2
