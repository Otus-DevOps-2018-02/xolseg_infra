# xolseg_infra
xolseg Infra repository

HomeWork #4
bastion_ip=35.204.157.253
someinterlnalhost_ip=10.164.0.3
#1
$ssh -A -t appuser@35.204.157.253 ssh -A appuser@10.164.0.3
#2
$alias someinternalhost="ssh -A -t appuser@35.204.157.253 ssh -A appuser@10.164.0.3" 
Or
add .ssh/config
Host someinternalhost
        HostName 10.164.0.3
        User appuser
        ProxyCommand ssh -W %h:%p appuser@35.204.157.253
