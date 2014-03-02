## Pieko-vagrant

Vagrant box bootstrapped for [Pieko](https://github.com/robvanbentem/pieko) development. This box is initially configured with [PuPHPet](https://puphpet.com/).

### Installation

1. download install your vagrant box with `vagrant up`
2. ssh into your box with `vagrant ssh`
3. edit the `/vagrant/pieko/pieko.sh` file and change the `GITUSER` and `GITEMAIL` setting to your own information.
4. (optional): change the `GITREPO` and `GITORIGIN` settings to your own repo. this document is intended for direct contributors.
5. run the before mentioned file `/vagrant/pieko/pieko.sh`. this will create the nginx vhosts, clone Pieko (and adminer) from github, downloads packages with composer and runs migrations.
6. (optional): the script will create a ssh key pair to use with github. the public key will be displayed at the end. you can configure this key in your [github account](https://github.com/settings/ssh).
7. add `192.168.56.101 pieko.dev` and `192.168.56.101 adminer.pieko.dev` to your hosts file.
7. everything is set up now, go to <http://pieko.dev> to check it out!

Optionally you can set up a shared folder in virtualbox that syncs the `/var/www/pieko.dev` folder to your host system. On windows systems this is not recommended because of performance issues.

### Issues

- An error will display at the end of  `vagrant up` with the message: `Cannot create /var/www/html;`. This is not a problem and can be ignored.
- During the installation through the `pieko.sh` script, composer can suspend downloading and ask for your Github credentials. This is because we need quite a lot of packages and Github can throttle anonymous users.

### Basic information

- Box IP: `192.168.56.101`
- SSH info: `u:vagrant` `p:vagrant`
- Pieko url: <http://pieko.dev> or <http://www.pieko.dev>
- Pieko root folder: `/var/www/pieko.dev`
- MySQL root password: `pieko`
- Pieko MySQL info: `u:pieko` `p:pieko` `db:pieko`
- Adminer url: <http://adminer.pieko.dev> or <http://mysql.pieko.dev>
- Mailcatcher url: <http://192.168.56.101:1080>


### Requirements

- Virtualbox 4.3
- Vagrant 1.4.3

### Software used

- Debian Wheezy 7.2 x64
- Nginx
- PHP 5.5
- MySQL
- Mailcatcher
- Adminer
- Xdebug
- [PuPHPet](https://puphpet.com/)