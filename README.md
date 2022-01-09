#coursework I

1. 

2. Установите ufw и разрешите к этой машине сессии на порты 22 и 443, при этом трафик на интерфейсе localhost (lo) должен ходить свободно на все порты.

ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 443/tcp
ufw status


Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere                  
443/tcp                    ALLOW       Anywhere                  
22/tcp (v6)                ALLOW       Anywhere (v6)             
443/tcp (v6)               ALLOW       Anywhere (v6) 

3.

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && sudo apt-get install vault

root@vagrant:/home/vagrant# vault -v
Vault v1.9.2

4. 

apt-get install jq 


vault - service

crontab -e

systemctl restart cron.service

5.

CA_cert.crt

/usr/local/share/ca-certificates
update-ca-certificates


 
