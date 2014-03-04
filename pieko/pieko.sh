#!/bin/bash

GITUSER="Foo Bar"
GITMAIL=foo@bar.com

GITREPO="https://github.com/robvanbentem/pieko.git"
GITORIGIN="ssh://git@github.com/robvanbentem/pieko.git"

SSHPASS=

PIEKODIR=/var/www/pieko.dev
ADMINERDIR=/var/www/adminer

git config --global user.name "$GITUSER"
git config --global user.email $GITEMAIL

sudo mkdir $PIEKODIR
sudo chown -R vagrant:vagrant $PIEKODIR
cd $PIEKODIR

git clone "$GITREPO" .

git remote rm origin
git remote add origin $GITORIGIN

composer update

php artisan migrate:install
php artisan migrate --seed

sudo chown -R www-data:www-data $PIEKODIR/app/storage

sudo mkdir $ADMINERDIR
sudo chown -R vagrant:vagrant $ADMINERDIR
cd $ADMINERDIR
git clone https://github.com/dg/adminer-custom.git .

sudo cp /vagrant/pieko/*.conf /etc/nginx/conf.d/
sudo /etc/init.d/nginx restart

echo 'cd /var/www/pieko.dev' >> /home/vagrant/.bashrc

ssh-keygen -t rsa -C "$GITMAIL" -q -f /home/vagrant/.ssh/id_rsa -N "$SSHPASS"

echo "Add your public key to your github account: https://github.com/settings/ssh"
echo "----- BEGIN KEY -----"
cat /home/vagrant/.ssh/id_rsa.pub
echo "------ END KEY ------"
