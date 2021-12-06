# Домашнее задание к занятию "3.7. Компьютерные сети, лекция 2"

## 1. Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?

### Ответ

В Linux: 

Ранее использовалась утлита ifconfig можно и сейчас ей воспользоваться, для этого в debian подобных ОС можно воспользоваться системой менеджера пакетов:

```bash
apt-get install net-tools -y && ifconfig 
```

В современных дистрибутивах по умолчанию установлена утилита ip:

<<<<<<< HEAD
	root@zh:/home/anber# ip -br -c l
	lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
	eth0             DOWN           00:26:18:a3:26:32 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
	wlan0            UP             00:16:ea:c6:89:dc <BROADCAST,MULTICAST,UP,LOWER_UP> 
	tun0             UNKNOWN        <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> 
	
Вывод только основной информации -brief, -c - color, l - link.
Как видно интерфейс eth0 присутствует, драйвер установлен, есть MAC адрес, но находиться в down, не подключен сетевой кабель.

В Windows:

Можно воспользоваться утилитой ipconfig.

## 2. Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого?

### Ответ

Протокол cdp - Cisco Discovery Protocol разработан в Cisco в 1994. [wiki](https://en.wikipedia.org/wiki/Cisco_Discovery_Protocol)


Посмотреть список соседей можно командой:

	R01#sh cdp neighbors 
	Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  	S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone, 
                  	D - Remote, C - CVTA, M - Two-port Mac Relay 
	
	Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
	K.115            Gig 1/0/4         173              S I   WS-C2960- Gig 0/1
	K.117            Gig 1/0/3         144              S I   WS-C2960- Gig 0/1
	
В Linux можно воспользоваться Link Layer Discovery Protocol (LLDP) [wiki](https://en.wikipedia.org/wiki/Link_Layer_Discovery_Protocol)

```bash
apt-get install lldpd -y && systemctl enable lldpd && systemctl start lldpd && lldpctl
```

	-------------------------------------------------------------------------------
	LLDP neighbors:
	-------------------------------------------------------------------------------
	Interface:    enp3s0, via: LLDP, RID: 1, Time: 0 day, 01:17:57
  	Chassis:     
    	ChassisID:    mac 00:22:be:c2:5e:8b
    	SysName:      switch.R10
    	SysDescr:     Cisco IOS Software, CBS30X0 Software (CBS30X0-LANBASE-M), Version 12.2(40)SE2, RELEASE SOFTWARE (fc1)
                  	Copyright (c) 1986-2007 by Cisco Systems, Inc.
                  	Compiled Wed 26-Dec-07 08:18 by myl
    	MgmtIP:       10.10.10.85
    	MgmtIface:    11
    	Capability:   Bridge, off
    	Capability:   Router, off
  	Port:        
    	PortID:       local Gi0/11
    	PortDescr:    GigabitEthernet0/11
    	TTL:          120
    	PMD autoneg:  supported: no, enabled: yes
      	Adv:          1000Base-T, HD: no, FD: yes
      MAU oper type: 1000BaseTFD - Four-pair Category 5 UTP, full duplex mode
  	VLAN:         1, pvid: yes
	-------------------------------------------------------------------------------
	Interface:    enp7s0, via: LLDP, RID: 2, Time: 0 day, 01:17:51
  	Chassis:     
    	ChassisID:    mac 00:22:be:c2:76:0b
    	SysName:      switch.R10
    	SysDescr:     Cisco IOS Software, CBS30X0 Software (CBS30X0-LANBASE-M), Version 12.2(40)SE2, RELEASE SOFTWARE (fc1)
                  	Copyright (c) 1986-2007 by Cisco Systems, Inc.
                  	Compiled Wed 26-Dec-07 08:18 by myl
    	MgmtIP:       10.10.10.67
    	MgmtIface:    11
    	Capability:   Bridge, off
    	Capability:   Router, off
  	Port:        
    	PortID:       local Gi0/11
    	PortDescr:    GigabitEthernet0/11
    	TTL:          120
    	PMD autoneg:  supported: no, enabled: yes
      	Adv:          1000Base-T, HD: no, FD: yes
      	MAU oper type: 1000BaseTFD - Four-pair Category 5 UTP, full duplex mode
  	VLAN:         1, pvid: yes
	-------------------------------------------------------------------------------
	
В выводе можно увидеть, что сосед сервера - коммутатор Cisco, порты к котороым подключен сервер, версию IOS, модель и т.д. 		
## 3. Какая технология используется для разделения L2 коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига.

### Ответ

Используется VLAN (Virtual Local Area Network) [wiki](https://en.wikipedia.org/wiki/Virtual_LAN)

Доустанавливается необходимый пакет командой:

```bash
apt-get install vlan
```
=======
	root@debian:~# telnet stackoverflow.com 80
	Trying 151.101.129.69...
	Connected to stackoverflow.com.
	Escape character is '^]'.
	GET /questions HTTP/1.0
	HOST: stackoverflow.com

	HTTP/1.1 301 Moved Permanently
	cache-control: no-cache, no-store, must-revalidate
	location: https://stackoverflow.com/questions
	x-request-guid: 167a072e-601a-421e-8f5a-0a6fb5935902
	feature-policy: microphone 'none'; speaker 'none'
	content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com
	Accept-Ranges: bytes
	Date: Mon, 06 Dec 2021 01:15:14 GMT
	Via: 1.1 varnish
	Connection: close
	X-Served-By: cache-hhn4050-HHN
	X-Cache: MISS
	X-Cache-Hits: 0
	X-Timer: S1638753315.538234,VS0,VE170
	Vary: Fastly-SSL
	X-DNS-Prefetch-Control: off
	Set-Cookie: prov=7c437fa7-13b1-4a79-73c8-dd15b8d5a125; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly

	Connection closed by foreign host.



HTTP код 301.

Описание из [https://ru.wikipedia.org/wiki/HTTP_301):
 
301 — Код состояния HTTP 301 или Moved Permanently (с англ. — «Перемещено навсегда») — стандартный код ответа HTTP, получаемый в ответ от сервера в ситуации, когда запрошенный ресурс был на постоянной основе перемещён в новое месторасположение, и указывающий на то, что текущие ссылки, использующие данный URL, должны быть обновлены. Адрес нового месторасположения ресурса указывается в поле Location получаемого в ответ заголовка пакета протокола HTTP.
>>>>>>> f9c66f7878f6588cf3438c3d81201e2cea896594

Необходимо проверить, что модуль ядра загружен: lsmod | grep 8021q
Если нет, то загрузить: modprobe 8021q

Можно воспользоваться утилитой vconfig для настройки VLAN:  vconfig add eth0 200
Также подойдет команда ip: ip link add link eth0 name eth0.200 type vlan id 200
С последующим присвоением ip адреса.

Для постоянного добавления VLAN необходимо внести изменения в файл конфигурации интерфейсов:

В случае Ubuntu необходимо изменить /etc/network/interfaces

	auto eth0.200
	iface eth0.200 inet static
        	address 192.168.200.1
        	netmask 255.255.255.0
        	vlan_raw_device eth0

## 4. Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига.

### Ответ

В Linux доступна агрегация портов bonding

Ядром Linux поддерживаются несколько типов агрегаций [debian-help](https://debian-help.ru/nastroika-seti-v-debian/bonding/):	

mode=0 (balance-rr) Round Robin - Пакеты отправляются в стиле round robin (то есть по кругу) через даступные ведомые интерфейсы. Осуществляет как балансировку нагрузки, так и защиту от ошибок.

mode=1 (active-backup) Active Backup - Один ведомый интерфейс всегда остается активным в случае выхода из строя заменяется другим.

mode=2 Balance XOR - Один и тот же интерфейс работает с определённым получателем. Режим даёт балансировку нагрузки и отказоустойчивость.

mode=3 (broadcast) - Передается всё на все интерфейсы. Обеспечивает защиту от ошибок.

mode=4 (802.3ad) - Это классическое динамическое объединение каналов на основе IEEE 802.3ad

mode=5 (balance-tlb) - Адаптивная балансировка исходящего трафика. Входящий траффик приходит только на активный интерфейс, а исходящий трафик распределяется в зависимости от нагрузки на каждом интерфейсе. Не требует особой поддержки со стороны коммутатора.

mode=6 (balance-alb) - Адаптивная балансировка нагрузки - обеспечивает баланскировку как входящей, так и исходящей нагрузки.

 
Пример настройки для active-backup один ведомый интерфейс всегда остается активным в случае выхода из строя заменяется другим:

Пример конфига из [wiki.debian.org](https://wiki.debian.org/Bonding#Configuration_-_Example_1)

Для начала необходимо установить требуемый пакет:

``` bash
apt-get install ifenslave
```

Включить модуль ядра modprobe bonding

Необходимо выключить существующие физические интерфейсы участвующие в bond либо командой ifdown ethX либо ifconfig ethX down.
После чего остановить сетевую службу.

Далее необходимо внести изменения в файл настройки интерфейсов /etc/network/interfaces

	auto bond0
	
	iface bond0 inet static
    		address 10.31.1.5
    		netmask 255.255.255.0
    		network 10.31.1.0
    		gateway 10.31.1.254
    		bond-slaves eth0 eth1
    		bond-mode active-backup
    		bond-miimon 100
    		bond-downdelay 200
    		bond-updelay 200
		
Включить сетевую службу и агрегированный интерфейс.

Далее можно просмотреть статистику агрегированного интерфейса:

```bash
cat /proc/net/bonding/bond0
```

## 5. Сколько IP адресов в сети с маской /29 ? Сколько /29 подсетей можно получить из сети с маской /24. Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.

### Ответ

Можно восползоваться утилитой ipcalc и получим 32 подсети 192 хоста.

Несолько примеров:

	root@zh:/home/anber# ipcalc 10.10.10.0 /24 /29
	Address:   10.10.10.0           00001010.00001010.00001010. 00000000
	Netmask:   255.255.255.0 = 24   11111111.11111111.11111111. 00000000
	Wildcard:  0.0.0.255            00000000.00000000.00000000. 11111111
	=>
	Network:   10.10.10.0/24        00001010.00001010.00001010. 00000000
	HostMin:   10.10.10.1           00001010.00001010.00001010. 00000001
	HostMax:   10.10.10.254         00001010.00001010.00001010. 11111110
	Broadcast: 10.10.10.255         00001010.00001010.00001010. 11111111
	Hosts/Net: 254                   Class A, Private Internet
	
	Subnets after transition from /24 to /29
	
	Netmask:   255.255.255.248 = 29 11111111.11111111.11111111.11111 000
	Wildcard:  0.0.0.7              00000000.00000000.00000000.00000 111
	
 	1.
	Network:   10.10.10.0/29        00001010.00001010.00001010.00000 000
	HostMin:   10.10.10.1           00001010.00001010.00001010.00000 001
	HostMax:   10.10.10.6           00001010.00001010.00001010.00000 110
	Broadcast: 10.10.10.7           00001010.00001010.00001010.00000 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	2.
	Network:   10.10.10.8/29        00001010.00001010.00001010.00001 000
	HostMin:   10.10.10.9           00001010.00001010.00001010.00001 001
	HostMax:   10.10.10.14          00001010.00001010.00001010.00001 110
	Broadcast: 10.10.10.15          00001010.00001010.00001010.00001 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	3.
	Network:   10.10.10.16/29       00001010.00001010.00001010.00010 000
	HostMin:   10.10.10.17          00001010.00001010.00001010.00010 001
	HostMax:   10.10.10.22          00001010.00001010.00001010.00010 110
	Broadcast: 10.10.10.23          00001010.00001010.00001010.00010 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	4.
	Network:   10.10.10.24/29       00001010.00001010.00001010.00011 000
	HostMin:   10.10.10.25          00001010.00001010.00001010.00011 001
	HostMax:   10.10.10.30          00001010.00001010.00001010.00011 110
	Broadcast: 10.10.10.31          00001010.00001010.00001010.00011 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	5.
	Network:   10.10.10.32/29       00001010.00001010.00001010.00100 000
	HostMin:   10.10.10.33          00001010.00001010.00001010.00100 001
	HostMax:   10.10.10.38          00001010.00001010.00001010.00100 110
	Broadcast: 10.10.10.39          00001010.00001010.00001010.00100 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	6.
	Network:   10.10.10.40/29       00001010.00001010.00001010.00101 000
	HostMin:   10.10.10.41          00001010.00001010.00001010.00101 001
	HostMax:   10.10.10.46          00001010.00001010.00001010.00101 110
	Broadcast: 10.10.10.47          00001010.00001010.00001010.00101 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	7.
	Network:   10.10.10.48/29       00001010.00001010.00001010.00110 000
	HostMin:   10.10.10.49          00001010.00001010.00001010.00110 001
	HostMax:   10.10.10.54          00001010.00001010.00001010.00110 110
	Broadcast: 10.10.10.55          00001010.00001010.00001010.00110 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	8.
	Network:   10.10.10.56/29       00001010.00001010.00001010.00111 000
	HostMin:   10.10.10.57          00001010.00001010.00001010.00111 001
	HostMax:   10.10.10.62          00001010.00001010.00001010.00111 110
	Broadcast: 10.10.10.63          00001010.00001010.00001010.00111 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	9.
	Network:   10.10.10.64/29       00001010.00001010.00001010.01000 000
	HostMin:   10.10.10.65          00001010.00001010.00001010.01000 001
	HostMax:   10.10.10.70          00001010.00001010.00001010.01000 110
	Broadcast: 10.10.10.71          00001010.00001010.00001010.01000 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	10.
	Network:   10.10.10.72/29       00001010.00001010.00001010.01001 000
	HostMin:   10.10.10.73          00001010.00001010.00001010.01001 001
	HostMax:   10.10.10.78          00001010.00001010.00001010.01001 110
	Broadcast: 10.10.10.79          00001010.00001010.00001010.01001 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	11.
	Network:   10.10.10.80/29       00001010.00001010.00001010.01010 000
	HostMin:   10.10.10.81          00001010.00001010.00001010.01010 001
	HostMax:   10.10.10.86          00001010.00001010.00001010.01010 110
	Broadcast: 10.10.10.87          00001010.00001010.00001010.01010 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	12.
	Network:   10.10.10.88/29       00001010.00001010.00001010.01011 000
	HostMin:   10.10.10.89          00001010.00001010.00001010.01011 001
	HostMax:   10.10.10.94          00001010.00001010.00001010.01011 110
	Broadcast: 10.10.10.95          00001010.00001010.00001010.01011 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	13.
	Network:   10.10.10.96/29       00001010.00001010.00001010.01100 000
	HostMin:   10.10.10.97          00001010.00001010.00001010.01100 001
	HostMax:   10.10.10.102         00001010.00001010.00001010.01100 110
	Broadcast: 10.10.10.103         00001010.00001010.00001010.01100 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	14.
	Network:   10.10.10.104/29      00001010.00001010.00001010.01101 000
	HostMin:   10.10.10.105         00001010.00001010.00001010.01101 001
	HostMax:   10.10.10.110         00001010.00001010.00001010.01101 110
	Broadcast: 10.10.10.111         00001010.00001010.00001010.01101 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	15.
	Network:   10.10.10.112/29      00001010.00001010.00001010.01110 000
	HostMin:   10.10.10.113         00001010.00001010.00001010.01110 001
	HostMax:   10.10.10.118         00001010.00001010.00001010.01110 110
	Broadcast: 10.10.10.119         00001010.00001010.00001010.01110 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	16.
	Network:   10.10.10.120/29      00001010.00001010.00001010.01111 000
	HostMin:   10.10.10.121         00001010.00001010.00001010.01111 001
	HostMax:   10.10.10.126         00001010.00001010.00001010.01111 110
	Broadcast: 10.10.10.127         00001010.00001010.00001010.01111 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	17.
	Network:   10.10.10.128/29      00001010.00001010.00001010.10000 000
	HostMin:   10.10.10.129         00001010.00001010.00001010.10000 001
	HostMax:   10.10.10.134         00001010.00001010.00001010.10000 110
	Broadcast: 10.10.10.135         00001010.00001010.00001010.10000 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	18.
	Network:   10.10.10.136/29      00001010.00001010.00001010.10001 000
	HostMin:   10.10.10.137         00001010.00001010.00001010.10001 001
	HostMax:   10.10.10.142         00001010.00001010.00001010.10001 110
	Broadcast: 10.10.10.143         00001010.00001010.00001010.10001 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	19.
	Network:   10.10.10.144/29      00001010.00001010.00001010.10010 000
	HostMin:   10.10.10.145         00001010.00001010.00001010.10010 001
	HostMax:   10.10.10.150         00001010.00001010.00001010.10010 110
	Broadcast: 10.10.10.151         00001010.00001010.00001010.10010 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	20.
	Network:   10.10.10.152/29      00001010.00001010.00001010.10011 000
	HostMin:   10.10.10.153         00001010.00001010.00001010.10011 001
	HostMax:   10.10.10.158         00001010.00001010.00001010.10011 110
	Broadcast: 10.10.10.159         00001010.00001010.00001010.10011 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	21.
	Network:   10.10.10.160/29      00001010.00001010.00001010.10100 000
	HostMin:   10.10.10.161         00001010.00001010.00001010.10100 001
	HostMax:   10.10.10.166         00001010.00001010.00001010.10100 110
	Broadcast: 10.10.10.167         00001010.00001010.00001010.10100 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	22.
	Network:   10.10.10.168/29      00001010.00001010.00001010.10101 000
	HostMin:   10.10.10.169         00001010.00001010.00001010.10101 001
	HostMax:   10.10.10.174         00001010.00001010.00001010.10101 110
	Broadcast: 10.10.10.175         00001010.00001010.00001010.10101 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	23.
	Network:   10.10.10.176/29      00001010.00001010.00001010.10110 000
	HostMin:   10.10.10.177         00001010.00001010.00001010.10110 001
	HostMax:   10.10.10.182         00001010.00001010.00001010.10110 110
	Broadcast: 10.10.10.183         00001010.00001010.00001010.10110 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	24.
	Network:   10.10.10.184/29      00001010.00001010.00001010.10111 000
	HostMin:   10.10.10.185         00001010.00001010.00001010.10111 001
	HostMax:   10.10.10.190         00001010.00001010.00001010.10111 110
	Broadcast: 10.10.10.191         00001010.00001010.00001010.10111 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	25.
	Network:   10.10.10.192/29      00001010.00001010.00001010.11000 000
	HostMin:   10.10.10.193         00001010.00001010.00001010.11000 001
	HostMax:   10.10.10.198         00001010.00001010.00001010.11000 110
	Broadcast: 10.10.10.199         00001010.00001010.00001010.11000 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	26.
	Network:   10.10.10.200/29      00001010.00001010.00001010.11001 000
	HostMin:   10.10.10.201         00001010.00001010.00001010.11001 001
	HostMax:   10.10.10.206         00001010.00001010.00001010.11001 110
	Broadcast: 10.10.10.207         00001010.00001010.00001010.11001 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	27.
	Network:   10.10.10.208/29      00001010.00001010.00001010.11010 000
	HostMin:   10.10.10.209         00001010.00001010.00001010.11010 001
	HostMax:   10.10.10.214         00001010.00001010.00001010.11010 110
	Broadcast: 10.10.10.215         00001010.00001010.00001010.11010 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	28.
	Network:   10.10.10.216/29      00001010.00001010.00001010.11011 000
	HostMin:   10.10.10.217         00001010.00001010.00001010.11011 001
	HostMax:   10.10.10.222         00001010.00001010.00001010.11011 110
	Broadcast: 10.10.10.223         00001010.00001010.00001010.11011 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	29.
	Network:   10.10.10.224/29      00001010.00001010.00001010.11100 000
	HostMin:   10.10.10.225         00001010.00001010.00001010.11100 001
	HostMax:   10.10.10.230         00001010.00001010.00001010.11100 110
	Broadcast: 10.10.10.231         00001010.00001010.00001010.11100 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	30.
	Network:   10.10.10.232/29      00001010.00001010.00001010.11101 000
	HostMin:   10.10.10.233         00001010.00001010.00001010.11101 001
	HostMax:   10.10.10.238         00001010.00001010.00001010.11101 110
	Broadcast: 10.10.10.239         00001010.00001010.00001010.11101 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	31.
	Network:   10.10.10.240/29      00001010.00001010.00001010.11110 000
	HostMin:   10.10.10.241         00001010.00001010.00001010.11110 001
	HostMax:   10.10.10.246         00001010.00001010.00001010.11110 110
	Broadcast: 10.10.10.247         00001010.00001010.00001010.11110 111
	Hosts/Net: 6                     Class A, Private Internet
	
 	32.
	Network:   10.10.10.248/29      00001010.00001010.00001010.11111 000
	HostMin:   10.10.10.249         00001010.00001010.00001010.11111 001
	HostMax:   10.10.10.254         00001010.00001010.00001010.11111 110
	Broadcast: 10.10.10.255         00001010.00001010.00001010.11111 111
	Hosts/Net: 6                     Class A, Private Internet
	
	
	Subnets:   32
	Hosts:     192

## 6. Задача: вас попросили организовать стык между 2-мя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP адреса? Маску выберите из расчета максимум 40-50 хостов внутри подсети.
	
### Ответ

Использовать блок для использования в сценариях NAT операторского уровня 100.64.0.0/10.

Для 40-50 хостов можно использовать маску /26, таким образом будет доступно 62 ip адреса для хостов: 

	root@zh:/home/anber# ipcalc 100.64.0.0/26
	Address:   100.64.0.0           01100100.01000000.00000000.00 000000
	Netmask:   255.255.255.192 = 26 11111111.11111111.11111111.11 000000
	Wildcard:  0.0.0.63             00000000.00000000.00000000.00 111111
	=>
	Network:   100.64.0.0/26        01100100.01000000.00000000.00 000000
	HostMin:   100.64.0.1           01100100.01000000.00000000.00 000001
	HostMax:   100.64.0.62          01100100.01000000.00000000.00 111110
	Broadcast: 100.64.0.63          01100100.01000000.00000000.00 111111
	Hosts/Net: 62                    Class A

## 7. Как проверить ARP таблицу в Linux, Windows? Как очистить ARP кеш полностью? Как из ARP таблицы удалить только один нужный IP?

### Ответ

В Linux проверить ARP таблицу можно arp -a или ip neigh.
В Windows arp -a

Очистить полностью в Linux: ip neigh flush all	
Очистить полностью в Windows: netsh interface ip delete arpcache

Удалить один нужный IP в Linux: arp -d IP или ip neigh del dev DEV ADDR, где DEV - имя интерфейса, ADDR - IP адрес хоста.
Удалить один нужный IP в Windows: arp -d IP

