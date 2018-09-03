#!/bin/bash
echo "enter site name"
read site;
echo "enter folder name"
read name;
mkdir /home/guru/Sites/$name;
cd /home/guru/Sites/$name;
wget https://ftp.drupal.org/files/projects/drupal-8.5.6.tar.gz;
tar -xvf drupal-8.5.6.tar.gz;
mv drupal-8.5.6 drupal;
sudo rm drupal-8.5.6.tar.gz;
cp /home/guru/Sites/$name/drupal/sites/default/default.settings.php /home/guru/Sites/$name/drupal/sites/default/settings.php
sudo chmod 777 /home/guru/Sites/$name/drupal/sites/default/settings.php;
mkdir /home/guru/Sites/$name/drupal/sites/default/files;
sudo chmod 777 /home/guru/Sites/$name/drupal/default/files;
sudo cp /home/guru/conf /etc/nginx/sites-available/$name;
sudo sed -i "2 a server_name $site;" /etc/nginx/sites-available/$name;
sudo sed -i "4 a root /home/guru/Sites/$name/drupal;" /etc/nginx/sites-available/$name;
sudo ln -s /etc/nginx/sites-available/$name /etc/nginx/sites-enabled;
sudo sed -i "2 a 127.0.0.1  $site" /etc/hosts;
echo "enter databse name";
read databse;
mysqladmin -u  root -p create $database;
