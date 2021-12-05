
# Домашнее задание к занятию "3.5. Файловые системы"

## 1. Узнайте о sparse (разряженных) файлах.

### Ответ

Ознакомился с информаией из wiki. Выполнил примеры.

## 2. Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?

### Ответ

Нет не могут, так как фактически на диске объект один и соответственно иметь разные права доступа и владельцев не может.

## 3. Сделайте vagrant destroy на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:

### Ответ

Виртуальная машина запущена

## 4. Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.

### Ответ

	root@vagrant:/home/vagrant# fdisk -l /dev/sdb
	Disk /dev/sdb: 2.51 GiB, 2684354560 bytes, 5242880 sectors
	Disk model: VBOX HARDDISK   
	Units: sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disklabel type: dos
	Disk identifier: 0x6e2865c9
	
	Device     Boot   Start     End Sectors  Size Id Type
	/dev/sdb1          2048 4196351 4194304    2G 83 Linux
	/dev/sdb2       4196352 5242879 1046528  511M 83 Linux
	
## 5. Используя sfdisk, перенесите данную таблицу разделов на второй диск.

	sfdisk -d /dev/sdb | sfdisk /dev/sdc

	root@vagrant:/home/vagrant# fdisk -l /dev/sdc
	Disk /dev/sdc: 2.51 GiB, 2684354560 bytes, 5242880 sectors
	Disk model: VBOX HARDDISK   
	Units: sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disklabel type: dos
	Disk identifier: 0x6e2865c9
	
	Device     Boot   Start     End Sectors  Size Id Type
	/dev/sdc1          2048 4196351 4194304    2G 83 Linux
	/dev/sdc2       4196352 5242879 1046528  511M 83 Linux


## 6. Соберите mdadm RAID1 на паре разделов 2 Гб.

### Ответ

	mdadm --create /dev/md1 --level=1 --raid-device=2 /dev/sdb1 /dev/sdc1

## 7. Соберите mdadm RAID0 на второй паре маленьких разделов.

### Ответ

	mdadm --create /dev/md0 --level=0 --raid-device=2 /dev/sdb2 /dev/sdc2

## 8. Создайте 2 независимых PV на получившихся md-устройствах.

### Ответ

	pvcreate /dev/md0
	pvcreate /dev/md1


Посмотрим, что все нормально pvdisplay 

## 9. Создайте общую volume-group на этих двух PV.

### Ответ

Создание групп томов

	vgcreate volume-group /dev/md0 /dev/md1

Посмотреть vgdisplay

## 10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

### Ответ

	lvcreate -L 100M volume-group  /dev/md0


## 11. Создайте mkfs.ext4 ФС на получившемся LV.

### Ответ

	mkfs.ext4 /dev/volume-group/lvol0

## 12. Смонтируйте этот раздел в любую директорию, например, /tmp/new.

### Ответ

	mount /dev/volume-group/lvol0 /tmp/new/

## 13. Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz.

## 14. Прикрепите вывод lsblk.

root@vagrant:/home/vagrant# lsblk 
NAME                      MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                         8:0    0   64G  0 disk  
├─sda1                      8:1    0  512M  0 part  /boot/efi
├─sda2                      8:2    0    1K  0 part  
└─sda5                      8:5    0 63.5G  0 part  
  ├─vgvagrant-root        253:0    0 62.6G  0 lvm   /
  └─vgvagrant-swap_1      253:1    0  980M  0 lvm   [SWAP]
sdb                         8:16   0  2.5G  0 disk  
├─sdb1                      8:17   0    2G  0 part  
│ └─md1                     9:1    0    2G  0 raid1 
└─sdb2                      8:18   0  511M  0 part  
  └─md0                     9:0    0 1018M  0 raid0 
    └─volume--group-lvol0 253:2    0  100M  0 lvm   /tmp/new
sdc                         8:32   0  2.5G  0 disk  
├─sdc1                      8:33   0    2G  0 part  
│ └─md1                     9:1    0    2G  0 raid1 
└─sdc2                      8:34   0  511M  0 part  
  └─md0                     9:0    0 1018M  0 raid0 
    └─volume--group-lvol0 253:2    0  100M  0 lvm   /tmp/new

## 15. Протестируйте целостность файла:

### Ответ

	gzip -t /tmp/new/test.gz
	root@vagrant:/home/vagrant# echo $?
	0

## 16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

### Ответ

	root@vagrant:/home/vagrant# pvmove /dev/md0 /dev/md1 
  	/dev/md0: Moved: 20.00%
  	/dev/md0: Moved: 100.00%

root@vagrant:/home/vagrant# lsblk 
NAME                      MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                         8:0    0   64G  0 disk  
├─sda1                      8:1    0  512M  0 part  /boot/efi
├─sda2                      8:2    0    1K  0 part  
└─sda5                      8:5    0 63.5G  0 part  
  ├─vgvagrant-root        253:0    0 62.6G  0 lvm   /
  └─vgvagrant-swap_1      253:1    0  980M  0 lvm   [SWAP]
sdb                         8:16   0  2.5G  0 disk  
├─sdb1                      8:17   0    2G  0 part  
│ └─md1                     9:1    0    2G  0 raid1 
│   └─volume--group-lvol0 253:2    0  100M  0 lvm   /tmp/new
└─sdb2                      8:18   0  511M  0 part  
  └─md0                     9:0    0 1018M  0 raid0 
sdc                         8:32   0  2.5G  0 disk  
├─sdc1                      8:33   0    2G  0 part  
│ └─md1                     9:1    0    2G  0 raid1 
│   └─volume--group-lvol0 253:2    0  100M  0 lvm   /tmp/new
└─sdc2                      8:34   0  511M  0 part  
  └─md0                     9:0    0 1018M  0 raid0 

## 17. Сделайте --fail на устройство в вашем RAID1 md.

### Ответ

	mdadm /dev/md1 --fail /dev/sdc1

## 18. Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.

### Ответ

	dmesg -T
	[Wed Dec  1 13:56:07 2021] md/raid1:md1: Disk failure on sdc1, disabling device.
	md/raid1:md1: Operation continuing on 1 devices.

## 19. Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:

### Ответ
	
	root@vagrant:/home/vagrant# gzip -t /tmp/new/test.gz
	root@vagrant:/home/vagrant# echo $?
	0


	root@vagrant:/home/vagrant# mdadm -D /dev/md1
	/dev/md1:
	Version : 1.2
	Creation Time : Wed Dec  1 13:21:18 2021
	Raid Level : raid1
	Array Size : 2094080 (2045.00 MiB 2144.34 MB)
	Used Dev Size : 2094080 (2045.00 MiB 2144.34 MB)
	Raid Devices : 2
	Total Devices : 2
	Persistence : Superblock is persistent

	Update Time : Wed Dec  1 13:56:07 2021
	State : clean, degraded 
	Active Devices : 1
	Working Devices : 1
	Failed Devices : 1	
	Spare Devices : 0

	Consistency Policy : resync

	Name : vagrant:1  (local to host vagrant)
	UUID : 64ebdafe:9b54f322:6bfcafb4:adc333d9
	Events : 19
	Number   Major   Minor   RaidDevice State
	0       8       17        0      active sync   /dev/sdb1
	-       0        0        1      removed

	1       8       33        -      faulty   /dev/sdc1



