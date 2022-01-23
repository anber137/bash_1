# Домашнее задание к занятию "5.2. Применение принципов IaaC в работе с виртуальными машинами"

## Задача 1

### Опишите своими словами основные преимущества применения на практике IaaC паттернов.

#### Решение:

Проедположим команда разаботчиков создала программный продукт, который умеет выполнять операцию  2 + 2. 
Команда тестировщиков вяснила, что в некоторых слуаях результат работы программного продукта отличается от 
предпологаемого. 
Но deadline уже прошел и клиент требует результат.
Команда маркетологов смогла исправить ситуацию и преподнисла данный баг как фичу, а именно: 

	"Молодая но очень перспективная команда разработчиков смогла избавиться от такого аттавизма как идемпотентность,
	и результат стал удивительным и не предсказуемым". 

Применение IaaC в данной команде позволило в установленные сроки получить среду разработки, тестирования и передать продукт в продакшн и каждый раз результат данных действий был предскзуем.

### Какой из принципов IaaC является основополагающим?

#### Решение:

Устранение границ между написанием приложений и созданием сред для этих приложений.

## Задача 2

### Чем Ansible выгодно отличается от других систем управление конфигурациями?

#### Решение:

Для Ansible не требуется установка агента не целевую систему. Для Linux используется ssh, для Windows WinRM.
Устанавливается в одном месте и таким образом не требуются дополнительные пакеты на удаленном сервере, что позволяет значительно экономить время.

### Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

#### Решение:

На мой взгляд метод push более предпочтителен, так как принятие решения о запуске сценариев происходит с одного места, сервера управления. Но с другой стороны все зависит от конкретной случая и политики безопасности. Возможна ситуация, когда подключение по ssh к серверам запрещено, но разрешенно подключения с серверов к серверу управления, тогда остается метод pull.

## Задача 3

#### Решение:

VirtualBox и Vagrant были установлены ранне в рамках выполнения предыдущих заданий:

```bash
   apt-get update
   apt install virtualbox
   apt install virtualbox-ext-pack
```

```
root@debian:/home/anber# apt-get install virtualbox virtualbox-ext-pack vagrant
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
virtualbox is already the newest version (6.1.28-dfsg-1~fto11+1).
virtualbox-ext-pack is already the newest version (6.1.28-1~fto11+1).
vagrant is already the newest version (2.2.19).
```

Устанавливаю и проверяю версию ansible

```bash
   root@debian:/home/anber# apt-get install ansible -y
   root@debian:/home/anber# ansible --version
```

```
   ansible 2.10.8
     config file = None
     configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python3/dist-packages/ansible
     executable location = /usr/bin/ansible
     python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110]
```

Проверить версию VirtualBox можно через dpkg -l либо virtualbox --help. 

Версию vagrant можно проверить:


```bash
 vagrant -v
```

   Vagrant 2.2.19


## Задача 4

#### Решение

В Vagrantfile поправил  NET = "192.168.192." на 192.168.56.

Ошибка при копировании ключа свазана с отсутствие ключа.

	anber@debian:/home/var5/vagrant$ vagrant up
	Bringing machine 'server1.netology' up with 'virtualbox' provider...
	==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202107.28.0' is up to date...
	==> server1.netology: Fixed port collision for 22 => 2222. Now on port 2201.
	==> server1.netology: Clearing any previously set network interfaces...
	==> server1.netology: Preparing network interfaces based on configuration...
   	 server1.netology: Adapter 1: nat
   	 server1.netology: Adapter 2: hostonly
	==> server1.netology: Forwarding ports...
   	 server1.netology: 22 (guest) => 20011 (host) (adapter 1)
   	 server1.netology: 22 (guest) => 2201 (host) (adapter 1)
	==> server1.netology: Running 'pre-boot' VM customizations...
	==> server1.netology: Booting VM...
	==> server1.netology: Waiting for machine to boot. This may take a few minutes...
   	 server1.netology: SSH address: 127.0.0.1:2201
   	 server1.netology: SSH username: vagrant
   	 server1.netology: SSH auth method: private key
	
   	 server1.netology: Warning: Connection reset. Retrying...
   	 server1.netology: Warning: Remote connection disconnect. Retrying...
   	 server1.netology: Warning: Connection reset. Retrying...
   	 server1.netology: 
   	 server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
   	 server1.netology: this with a newly generated keypair for better security.
   	 server1.netology: 
   	 server1.netology: Inserting generated public key within guest...
   	 server1.netology: Removing insecure key from the guest if it's present...
   	 server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
	==> server1.netology: Machine booted and ready!
	==> server1.netology: Checking for guest additions in VM...
	==> server1.netology: Setting hostname...
	==> server1.netology: Configuring and enabling network interfaces...
	==> server1.netology: Mounting shared folders...
   	 server1.netology: /vagrant => /home/var5/vagrant
	==> server1.netology: Running provisioner: ansible...
   	 server1.netology: Running ansible-playbook...
	
	PLAY [nodes] *******************************************************************
	
	TASK [Gathering Facts] *********************************************************
	ok: [server1.netology]
	
	TASK [Create directory for ssh-keys] *******************************************
	changed: [server1.netology]
	
	TASK [Adding rsa-key in /root/.ssh/authorized_keys] ****************************
	An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option                                                                            
	fatal: [server1.netology]: FAILED! => {"changed": false, "msg": "Could not find or access '~/.ssh/id_rsa.pub' on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}                                 
	...ignoring
	
	TASK [Checking DNS] ************************************************************
	changed: [server1.netology]
	
	TASK [Installing tools] ********************************************************
	ok: [server1.netology] => (item=['git', 'curl'])
	
	TASK [Installing docker] *******************************************************
	
	
	changed: [server1.netology]
	
	TASK [Add the current user to docker group] ************************************
	changed: [server1.netology]
	
	PLAY RECAP *********************************************************************
	server1.netology           : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1   
	
	anber@debian:/home/var5/vagrant$ vagrant ssh
	Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-80-generic x86_64)
	
	 * Documentation:  https://help.ubuntu.com
	 * Management:     https://landscape.canonical.com
	 * Support:        https://ubuntu.com/advantage
	
 	 System information as of Sun 23 Jan 2022 11:55:16 AM UTC
	
 	 System load:  0.79              Users logged in:          0
 	 Usage of /:   3.3% of 61.31GB   IPv4 address for docker0: 172.17.0.1
 	 Memory usage: 26%               IPv4 address for eth0:    10.0.2.15
 	 Swap usage:   0%                IPv4 address for eth1:    192.168.56.11
 	 Processes:    107
	
	
	This system is built by the Bento project by Chef Software
	More information can be found at https://github.com/chef/bento
	Last login: Sun Jan 23 11:54:24 2022 from 10.0.2.2
	vagrant@server1:~$ docker ps
	CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
