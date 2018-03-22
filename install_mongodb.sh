#!/bin/bash
echo "add key repo"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927; sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
echo "update apt"
sudo apt update
echo "install mongodb"
sudo apt install -y mongodb-org
echo "enable and start mongo"
sudo systemctl start mongod; sudo systemctl enable mongod
