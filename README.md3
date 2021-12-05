# Домашнее задание к занятию "3.4. Операционные системы, лекция 2"

## 1. Создание самостоятельно простой unit-файл для node_exporter

### Решение  
	
Создал unit файл:

	systemd cat node_exporter

	/etc/systemd/system/node_exporter.service

	[Unit]
	Description=Prometheus Node Exporter
	Wants=network-online.target
	After=remote-fs.target network-online.target
	[Service]
	EnvironmentFile=-/etc/default/node_exporter
	ExecStart=/usr/sbin/node_exporter $EXTRA_OPTS
	KillMode=process
	Restart=on-failure
	[Install]
	WantedBy=multi-user.target

Добавил в автозагрузку sudo systemctl enable node_exporter.service

Провер состояние:

	vagrant@v:~$ systemctl status node_exporter
	● node_exporter.service - Prometheus Node Exporter
     		Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     	Active: active (running) since Sun 2021-11-28 16:14:47 UTC; 20h ago
   	Main PID: 623 (node_exporter)
      	Tasks: 8 (limit: 1112)
     	Memory: 18.4M
     	CGroup: /system.slice/node_exporter.service
         	    └─623 /usr/sbin/node_exporter --collector.cpu.info

После рестарта процесс корректно стартует. Параметры передаются через переменную $EXTRA_OPT, значение которой задается в файле окружения.

## 2. Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти диску и сети.

### Решение

Для CPU (в каком состоянии сколько находиться в секундах):

``` bash
curl -s localhost:9100/metrics | grep  node_cpu_seconds_total
```

	# HELP node_cpu_seconds_total Seconds the CPUs spent in each mode.
	# TYPE node_cpu_seconds_total counter
	node_cpu_seconds_total{cpu="0",mode="idle"} 2956
	node_cpu_seconds_total{cpu="0",mode="iowait"} 5.99
	node_cpu_seconds_total{cpu="0",mode="irq"} 0
	node_cpu_seconds_total{cpu="0",mode="nice"} 0
	node_cpu_seconds_total{cpu="0",mode="softirq"} 1.43
	node_cpu_seconds_total{cpu="0",mode="steal"} 0
	node_cpu_seconds_total{cpu="0",mode="system"} 55.47
	node_cpu_seconds_total{cpu="0",mode="user"} 46.02
	node_cpu_seconds_total{cpu="1",mode="idle"} 2917.65
	node_cpu_seconds_total{cpu="1",mode="iowait"} 3.47
	node_cpu_seconds_total{cpu="1",mode="irq"} 0
	node_cpu_seconds_total{cpu="1",mode="nice"} 0
	node_cpu_seconds_total{cpu="1",mode="softirq"} 2.03
	node_cpu_seconds_total{cpu="1",mode="steal"} 0
	node_cpu_seconds_total{cpu="1",mode="system"} 41.19
	node_cpu_seconds_total{cpu="1",mode="user"} 29.85


Для памяти (свободная память в байтах):

``` bash
curl -s localhost:9100/metrics | grep node_memory_MemFree_bytes
```
	# HELP node_memory_MemFree_bytes Memory information field MemFree_bytes.
	# TYPE node_memory_MemFree_bytes gauge
	node_memory_MemFree_bytes 3.46857472e+08

Также удобно было бы использовать:    	

	node_memory_MemTotal_bytes
    	node_memory_Cached_bytes
    	node_memory_Buffers_bytes


Для сети можно использовать переданное и полученое количество байт:

``` bash
curl -s localhost:9100/metrics | grep 'node_network_receive_bytes_total{device="eth0"}'
```
	node_network_receive_bytes_total{device="eth0"} 2.009426e+06


``` bash
curl -s localhost:9100/metrics | grep 'node_network_transmit_bytes_total{device="eth0"}'
```

	node_network_transmit_bytes_total{device="eth0"} 4.380297e+06


Для дисковой подсистемы прочитанный и записанный объем в байтах:

``` bash
	curl -s localhost:9100/metrics | grep node_disk_'read_bytes_total{device="sda"\|written_bytes_total{device="sda"}'
```


## 3. Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata). После успешной установки:

## Решение

Виртуальная машина Netdata установлена порт проброшен:
	
	vagrant@v:~$ ps -aux | grep netdata
	netdata      609  1.4  7.5 285372 76116 ?        Ssl  Nov29  15:21 /usr/sbin/netdata -D
	
	
	anber@debian:/home/var2$ cat ./Vagrantfile 
	Vagrant.configure("2") do |config|
        	config.vm.box = "bento/ubuntu-20.04"
        	config.vm.network "forwarded_port", guest: 19999, host: 19999
	end

На хосте где запущен virtualbox порт 19999 по адресу localhost доступен:

        anber@debian:/home/var2$ ss -tulpn '( sport 19999 )'
	Local Address:Port 0.0.0.0:19999
 
	anber@debian:/home/var2$ telnet localhost 19999
	Trying ::1...
	Trying 127.0.0.1...
	Connected to localhost.
	Escape character is '^]'.

В браузере lynx 127.0.0.1:19999 также почти все отображается:                                                                         

	netdata dashboard (p1 of 20)
	You must enable JavaScript in order to use Netdata!
	You can do this in your browser settings.

	(BUTTON) Toggle navigation
    	 * [netdata-logomark.svg]
    	 * my-netdata
      	 Loading, please wait...
     	*  Nodes^ beta

При дальнейшем пробросе порта на компьютер где имеется обычный браузер все отобразилось. С метриками ознакомился.

![Alt](Screenshot_20211130_013602.png "Screenshot netdata")

## 4. Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?

### Ответ

Да

В выводе dmesg имеется упоминание про Hypervisor:	
	
	dmesg|grep Hyper
	Hypervisor detected: KVM

Также ОС может определить по оборудованию: 

	dmesg |grep DMI
	[    0.000000] DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006

Для примера DMI на физическом хосте:

	# dmesg | grep DMI
	[    0.000000] DMI: IBM System x3650 M4 : -[7915K4G]-/00J6520, BIOS -[VVE124AUS-1.30]- 11/21/2012

И на виртуальной машине VMWare ESXi:

	# dmesg | grep DMI
	[    0.000000] DMI 2.6 present.
	[    0.000000] DMI: VMware, Inc. VMware7,1/440BX Desktop Reference Platform, BIOS VMW71.00V.0.B64.1605280101 05/28/2016

	# dmesg | grep yper
	[    0.000000] Hypervisor detected: VMware

## 5. Как настроен sysctl fs.nr_open на системе по-умолчанию? Узнайте, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?

### Ответ
 
Максимальное количество файлов открытых одним процессом задается для всей системы:

	vagrant@v:~$ sysctl fs.nr_open
	fs.nr_open = 1048576

или 

	cat /proc/sys/fs/nr_open
	1024*1024 = 1048576

Максимальное количество файловых дискрипторов на процесс в данном экземпляре оболочки ulimit -n. Не может привышать fs.nr_open

т.е. 

	ulimit -n 1048577 

задать мы не можем не изменив nr_open (sudo sysctl -w fs.nr_open=1048577)

Если лимит на открытие файлов превышен, то мы получаем ошибку.

Пример:

	vagrant@v:~$ ulimit -n 2

	vagrant@v:~$ mc
	-bash: start_pipeline: pgrp pipe: Too many open files
	mc: error while loading shared libraries: libslang.so.2: cannot open shared object file: Error 24

И соответсвенно ulimit -n будет тем самым лимитом, который может не позволить достичь количества открытых файлов заданного параметром ядра fs.nr_open.

## 6. Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в данном задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.

### Решение:

Выполним:

	unshare -f --pid --mount-proc -- bash -c "echo $$ && sleep 1h" &

Определим PID процесса через: lsns либо ps -aux либо pgrep sleep

Подключимся:

	root@v:/home/vagrant# nsenter -t 1767 --mount -p или если sleep один процесс, то можно nsenter -t $(pgrep sleep) --mount -p
	root@v:/# 
	root@v:/# ps -aux
	USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root           1  0.0  0.0   8076   588 pts/0    S    18:04   0:00 sleep 1h
	root           2  3.0  0.4   9836  4236 pts/0    S    18:06   0:00 -bash
	root          11  0.0  0.3  11680  3584 pts/0    R+   18:06   0:00 ps -aux

## 7. Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

### Ответ:

Происходит рекурсивный вызов функции ":()" при каждом ее вызове создается еще две одна из которых в background.
Происходит до тех пор, пока не закончиться отведенное количество системных ресурсов.

Судя по выводу dmesg процесс котороый помог автоматической стабилизации: cgroup - control group based traffic control filter.

cgroups – это механизм ядра, позволяющий ограничивать использование, вести учет и изолировать потребление системных ресурсов (ЦП, память, дисковый ввод/вывод, сеть и т. п.) на уровне коллекций процессов.
Позволяет создавать контрольные группы и добавлять в них процессы с последующим огрничением ресурсов.
Настраиваемые подсистемы для групп можно посмотреть ls /sys/fs/cgroup/
Посмотреть список cgroup и запущенных процессов можно:


Выполнив 
	
	systemd-cgls --no-page

Можно увидеть, что группа или slice к которой относиться наша сесия: user-1000.slice

Изменить число процессов, которое можно создать в сессии можно так:
	systemctl set-property user-1000.slice TasksMax=3000
	cat /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max

Или можно ограничить доступ:

	echo 'c 1:3 rmw' > /sys/fs/cgroup/devices/user.slice/devices.deny

	root@v:/home/vagrant# echo "null" > /dev/null
	bash: /dev/null: Operation not permitted

Восстановим доступ:

	echo 'a' > /sys/fs/cgroup/devices/user.slice/devices.allow
