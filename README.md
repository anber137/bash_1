# Домашнее задание к занятию "3.8. Компьютерные сети, лекция 3"

## 1. Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP

### Решение

	route-views>show ip route 46.180.51.30   
	
	Routing entry for 46.180.0.0/15
  	Known via "bgp 6447", distance 20, metric 0
  	Tag 6939, type external
  	Last update from 64.71.137.241 2w1d ago
  	Routing Descriptor Blocks:
  	* 64.71.137.241, from 64.71.137.241, 2w1d ago
      	Route metric is 0, traffic share count is 1
      	AS Hops 3
      	Route tag 6939
      	MPLS label: none
	
	route-views>show bgp 46.180.51.30
	
	BGP routing table entry for 46.180.0.0/15, version 1381500306
	Paths: (24 available, best #23, table default)
  	Not advertised to any peer
  	Refresh Epoch 1
  	2497 1299 39927, (aggregated by 65423 192.168.21.136)
    	202.232.0.2 from 202.232.0.2 (58.138.96.254)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE049367CE0 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3267 31133 39927, (aggregated by 65423 192.168.21.211)
    	194.85.40.15 from 194.85.40.15 (185.141.126.1)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	path 7FE0D72A4450 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	20912 3257 28917 28917 28917 28917 28917 28917 28917 48858 48858 48858 39927 39927 39927 39927 39927 39927 39927 39927, (aggregated by 65423 192.168.21.211)
    	212.66.96.126 from 212.66.96.126 (212.66.96.126)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 3257:4000 3257:8133 3257:50001 3257:50110 3257:54901 20912:65004
      	path 7FE158114AE0 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 3
  	3303 31133 39927, (aggregated by 65423 192.168.21.211)
    	217.192.89.50 from 217.192.89.50 (138.187.128.158)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 0:15169 3303:1004 3303:1006 3303:1030 3303:3056 31133:26149
      	path 7FE0E5F3D8B0 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	4901 6079 31133 39927, (aggregated by 65423 192.168.21.211)
    	162.250.137.254 from 162.250.137.254 (162.250.137.254)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 65000:10100 65000:10300 65000:10400
      	path 7FE128838B88 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	7660 2516 1273 3216 39927 39927, (aggregated by 65423 192.168.21.211)
    	203.181.248.168 from 203.181.248.168 (203.181.248.168)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 2516:1030 7660:9003
      	path 7FE16B231DA8 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	57866 9002 48858 48858 48858 39927 39927 39927 39927 39927 39927 39927 39927, (aggregated by 65423 192.168.21.211)
    	37.139.139.17 from 37.139.139.17 (37.139.139.17)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	Community: 9002:0 9002:64667
      	path 7FE03EA47BA0 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	7018 1299 39927, (aggregated by 65423 192.168.21.136)
    	12.0.1.63 from 12.0.1.63 (12.0.1.63)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 7018:5000 7018:37232
      	path 7FE15C74D198 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3333 31133 39927, (aggregated by 65423 192.168.21.211)
    	193.0.0.56 from 193.0.0.56 (193.0.0.56)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE0B779CA48 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	49788 12552 31133 39927, (aggregated by 65423 192.168.21.211)
    	91.218.184.60 from 91.218.184.60 (91.218.184.60)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 12552:12000 12552:12100 12552:12101 12552:22000
      	Extended Community: 0x43:100:1
      	path 7FE017B5A0F8 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	8283 1299 39927, (aggregated by 65423 192.168.21.136)
    	94.142.247.3 from 94.142.247.3 (94.142.247.3)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	Community: 1299:30000 8283:1 8283:101
      	unknown transitive attribute: flag 0xE0 type 0x20 length 0x18
        	value 0000 205B 0000 0000 0000 0001 0000 205B
              	0000 0005 0000 0001 
      	path 7FE14202D0C8 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3356 3216 39927 39927, (aggregated by 65423 192.168.21.211)
    	4.68.4.46 from 4.68.4.46 (4.69.184.201)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	Community: 3216:2001 3216:4442 3356:2 3356:22 3356:100 3356:123 3356:503 3356:903 3356:2067
      	path 7FE175FCBF88 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	1221 4637 31133 39927, (aggregated by 65423 192.168.21.211)
    	203.62.252.83 from 203.62.252.83 (203.62.252.83)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE0FE893280 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	852 31133 39927, (aggregated by 65423 192.168.21.211)
    	154.11.12.212 from 154.11.12.212 (96.1.209.43)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	path 7FE0E0FE42F8 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	20130 6939 31133 39927, (aggregated by 65423 192.168.21.211)
    	140.192.8.16 from 140.192.8.16 (140.192.8.16)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE052CE1558 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	701 1273 3216 39927 39927, (aggregated by 65423 192.168.21.211)
    	137.39.3.55 from 137.39.3.55 (137.39.3.55)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE01D65B230 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3257 28917 28917 28917 28917 28917 28917 28917 48858 48858 48858 39927 39927 39927 39927 39927 39927 39927 39927, (aggregated by 65423 192.168.21.211)
    	89.149.178.10 from 89.149.178.10 (213.200.83.26)
      	Origin IGP, metric 10, localpref 100, valid, external, atomic-aggregate
      	Community: 3257:4000 3257:8133 3257:50001 3257:50110 3257:54901
      	path 7FE0BA11F5D0 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3549 3356 3216 39927 39927, (aggregated by 65423 192.168.21.211)
    	208.51.134.254 from 208.51.134.254 (67.16.168.191)
      	Origin IGP, metric 0, localpref 100, valid, external, atomic-aggregate
      	Community: 3216:2001 3216:4442 3356:2 3356:22 3356:100 3356:123 3356:503 3356:903 3356:2067 3549:2581 3549:30840
      	path 7FE11EF21988 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	53767 174 31133 39927, (aggregated by 65423 192.168.21.211)
    	162.251.163.2 from 162.251.163.2 (162.251.162.3)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 174:21101 174:22005 53767:5000
      	path 7FE0C5E12E80 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	101 11164 3491 20485 20485 25478 25478 39927 39927 39927 39927 39927 39927 39927 39927 39927 39927 39927, (aggregated by 65423 192.168.21.136)
    	209.124.176.223 from 209.124.176.223 (209.124.176.223)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 101:20100 101:22100 3491:300 3491:311 3491:9001 3491:9080 3491:9081 3491:9087 3491:62210 3491:62220 11164:1110 11164:7880 11164:7890 20485:10099 20485:51100 20485:51120
      	Extended Community: RT:101:22100
      	path 7FE111C89F28 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	3561 3910 3356 3216 39927 39927, (aggregated by 65423 192.168.21.211)
    	206.24.210.80 from 206.24.210.80 (206.24.210.80)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE02A140740 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	1351 20764 20764 20764 20764 20764 20764 20764 39927 39927 39927 39927 39927 39927 39927 39927 39927 39927 39927, (aggregated by 65423 192.168.21.136)
    	132.198.255.253 from 132.198.255.253 (132.198.255.253)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	path 7FE0F0C1BD28 RPKI State not found
      	rx pathid: 0, tx pathid: 0
  	Refresh Epoch 1
  	6939 31133 39927, (aggregated by 65423 192.168.21.211)
    	64.71.137.241 from 64.71.137.241 (216.218.252.164)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate, best
      	path 7FE00928AFF8 RPKI State not found
      	rx pathid: 0, tx pathid: 0x0
  	Refresh Epoch 1
  	19214 174 31133 39927, (aggregated by 65423 192.168.21.211)
    	208.74.64.40 from 208.74.64.40 (208.74.64.40)
      	Origin IGP, localpref 100, valid, external, atomic-aggregate
      	Community: 174:21101 174:22005
      	path 7FE0534594D8 RPKI State not found
      	rx pathid: 0, tx pathid: 0
	
## 2. Создайте dummy0 интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.

### Решение


Добавим в загружаемые модули ядра:

	root@vagrant:/home/vagrant# echo "dummy" >> /etc/modules

Создадим файл конфигурации на два интерфейса:

	root@vagrant:/home/vagrant# echo "options dummy numdummies=2" > /etc/modprobe.d/dummy.conf
	
Поправим файл конфигурации интерфейсов:

	root@vagrant:/home/vagrant# cat /etc/network/interfaces
	# interfaces(5) file used by ifup(8) and ifdown(8)
	# Include files from /etc/network/interfaces.d:
	source-directory /etc/network/interfaces.d
	
	auto dummy0
	iface dummy0 inet static
        address 10.2.2.2/32
        pre-up ip link add dummy0 type dummy
        post-down ip link del dummy0

Рестартуем сетевую службу:

	systemctl restart networking
	
Добавим несолько маршрутов:

	ip r a 192.168.10.0/24 dev dummy0
	ip r a 192.168.11.0/24 via 10.2.2.2
	ip r a 192.168.11.0/30 via 10.2.2.2	
		
Просмотрим маршруты:

	root@vagrant:/home/vagrant# ip r s
	default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100 
	10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 
	10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100 
	192.168.10.0/24 dev dummy0 scope link 
	192.168.11.0/30 via 10.2.2.2 dev dummy0 
	192.168.11.0/24 via 10.2.2.2 dev dummy0 

## 3. Проверьте открытые TCP порты в Ubuntu, какие протоколы и приложения используют эти порты? Приведите несколько примеров.

### Решение


	root@vagrant:/home/vagrant# ss -npta
	State        Recv-Q       Send-Q              Local Address:Port               Peer Address:Port        Process                                                         
	LISTEN       0            4096                      0.0.0.0:111                     0.0.0.0:*            users:(("rpcbind",pid=591,fd=4),("systemd",pid=1,fd=71))       
	LISTEN       0            4096                127.0.0.53%lo:53                      0.0.0.0:*            users:(("systemd-resolve",pid=592,fd=13))                      
	LISTEN       0            128                       0.0.0.0:22                      0.0.0.0:*            users:(("sshd",pid=814,fd=3))                                  
	ESTAB        0            0                       10.0.2.15:22                     10.0.2.2:50748        users:(("sshd",pid=16914,fd=4),("sshd",pid=16865,fd=4))        
	LISTEN       0            4096                         [::]:111                        [::]:*            users:(("rpcbind",pid=591,fd=6),("systemd",pid=1,fd=78))       
	LISTEN       0            128                          [::]:22                         [::]:*            users:(("sshd",pid=814,fd=4)) 
	
	
Где n - не переводить в символьное обозначение, p - показывать процессы, t - TCP, a - отображать слушающие и не слушающие сокеты. Если хотим посмотреть только открытые порты, то можно вмсто a использвать l - только слушающие.


Из вывода видно, что процесс с PID 591 rpcbind (демон, сопоставляющий универсальные адреса и номера программ RPC)  слушает на порту 111 (sunrpc) как по IPv4 так и IPv6.
На порту 53 c ip из loopback 127.0.0.53 - DNS и на 22 - SSH. Также можно наблюдать с состоянием ESTAB текущую сесссию SSH. Для проверки "а точно ли слушает" можно выполнить  telnet 127.0.0.1 22 или telnet ::1 22. Ответит процесс sshd:

	root@vagrant:/home/vagrant# telnet ::1 22
	Trying ::1...
	Connected to ::1.
	Escape character is '^]'.
	SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.2

	Invalid SSH identification string.
	Connection closed by foreign host.

## 4. Проверьте используемые UDP сокеты в Ubuntu, какие протоколы и приложения используют эти порты?

Также можно проверить UDP порты командой ss изменив в передаваемых параметрах t на u

	root@vagrant:/home/vagrant# ss -puan
	State        Recv-Q       Send-Q               Local Address:Port               Peer Address:Port       Process                                                         
	UNCONN       0            0                    127.0.0.53%lo:53                      0.0.0.0:*           users:(("systemd-resolve",pid=592,fd=12))                      
	UNCONN       0            0                   10.0.2.15%eth0:68                      0.0.0.0:*           users:(("systemd-network",pid=395,fd=15))                      
	UNCONN       0            0                          0.0.0.0:111                     0.0.0.0:*           users:(("rpcbind",pid=591,fd=5),("systemd",pid=1,fd=77))       
	UNCONN       0            0                             [::]:111                        [::]:*           users:(("rpcbind",pid=591,fd=7),("systemd",pid=1,fd=79))   

Выполнить telnet как в п.3 не получиться, но можно воспользоваться к примеру утилитой nc. 
На первом терминале можно выполнить nc -lu 100 на втором можно увидеть, что появился новый порт 100 слушает его наш процесс nc с PID 17781.


	root@vagrant:/home/vagrant# ss -puan sport = 100
	State               Recv-Q              Send-Q                           Local Address:Port                           Peer Address:Port             Process             
	UNCONN              0                   0                                      0.0.0.0:100                                 0.0.0.0:*                 users:(("nc",pid=17781,fd=3))

Если из второго терминала выполнить: 

	vagrant@vagrant:~$ echo "Hello UPD 100" | nc -u 127.0.0.1 100

то на первом терминале увидим: Hello UPD 100

## 4. Используя diagrams.net, создайте L3 диаграмму вашей домашней сети или любой другой сети, с которой вы работали. 

### Решение

![Alt](5.png "Screenshot")


<a id="raw-url" href="https://raw.githubusercontent.com/anber137/bash_1/master/Untitled Diagram.drawio">Файл в формате drawio</a>



