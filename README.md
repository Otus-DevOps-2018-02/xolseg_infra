# xolseg_infra
xolseg Infra repository

#HomeWork #4

bastion_IP = 35.204.157.253

someinternalhost_IP = 10.164.0.3


##1
```$ssh -A -t appuser@35.204.157.253 ssh -A appuser@10.164.0.3```

##2
```$alias someinternalhost="ssh -A -t appuser@35.204.157.253 ssh -A appuser@10.164.0.3"```

add .ssh/config
```
```Host someinternalhost
        HostName 10.164.0.3
        User appuser
        ProxyCommand ssh -W %h:%p appuser@35.204.157.253
```

create vm and install 

```gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud  --machine-type=g1-small  --tags puma-server  --restart-on-failure --metadata startup-script='#!/bin/bash
sudo apt update
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927; sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential mongodb-org; sudo systemctl enable mongod; sudo systemctl start mongod
git clone -b monolith https://github.com/express42/reddit.git && cd reddit && bundle install'
```

##firewall gcloud

```gcloud compute firewall-rules create default-puma-server --target-tags=puma-server --allow tcp:9292```

##testapp
```
testapp_IP = 35.195.186.19
testapp_port = 9292
```
