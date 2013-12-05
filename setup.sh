#!/bin/bash
#Development environment setup
cd $HOME

#First, install node.js
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

#Second, install openssh-server
sudo apt-get install -y openssh-server

#Third, create .bash_aliases file and populate
cd $HOME
touch .bash_aliases
echo -e '#My alias list\n' >> .bash_aliases

echo '#For safety' >> .bash_aliases
echo "alias rm='rm -i'" >> .bash_aliases
echo "alias mv='mv -i'" >> .bash_aliases
echo "alias cp='cp -i'" >> .bash_aliases
echo -e 'set -o noclobber\n' >> .bash_aliases

echo '#Shortcuts' >> .bash_aliases
echo "alias home='cd $HOME'" >> .bash_aliases
echo "alias root='cd /'" >> .bash_aliases
echo "alias ..='cd ..'" >> .bash_aliases
echo "alias ...='cd ..;cd ..'" >> .bash_aliases
echo "alias md='mkdir'" >> .bash_aliases
echo "alias cl='clear'" >> .bash_aliases
echo "alias nd='nodemon'" >> .bash_aliases
echo -e "alias em='emacs'\n" >> .bash_aliases

echo '#Git shortcuts' >> .bash_aliases
echo "alias ga='git add'" >> .bash_aliases
echo "alias ga.='git add .'" >> .bash_aliases
echo "alias gps='git push -u origin'" >> .bash_aliases
echo "alias gpl='git pull -u origin'" >> .bash_aliases
echo "alias gc='git commit -m'" >> .bash_aliases
echo -e "alias gca='git commit -am'\n" >> .bash_aliases

#Fourth, install emacs24
cd $HOME
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24
sudo apt-get install -y emacs24-el
sudo apt-get install -y emacs24-common-non-dfsg

#Fifth, install Mongodb and start it
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-10gen
sudo service mongodb start

#Sixth, install Express.js globally with nodemon
sudo npm install -g express
sudo npm install -g nodemon

#Seventh, wget .screenrc from github.com/jerwey10
wget raw.github.com/jerwey10/dotfiles/master/.screenrc -O .screenrc

#Eighth, install git-core and add username and email
sudo apt-get install -y git-core
git config --global user.name "jerry.wolverton"
git config --global user.email "jerry_wolverton@sensar.ca"

#Ninth, insatll gitflow
sudo apt-get install -y gitflow
