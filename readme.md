

CPU:
vagrant@v:~/node_exporter-1.3.0.linux-amd64$ curl -s localhost:9100/metrics | grep  node_cpu_seconds_total
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


Mem:
vagrant@v:~/node_exporter-1.3.0.linux-amd64$ curl -s localhost:9100/metrics | grep node_memory_MemFree_bytes
# HELP node_memory_MemFree_bytes Memory information field MemFree_bytes.
# TYPE node_memory_MemFree_bytes gauge
node_memory_MemFree_bytes 3.46857472e+08


    node_memory_MemTotal_bytes
    node_memory_MemFree_bytes
    node_memory_Cached_bytes
    node_memory_Buffers_bytes


net
vagrant@v:~/node_exporter-1.3.0.linux-amd64$ curl -s localhost:9100/metrics | grep 'node_network_receive_bytes_total{device="eth0"}'node_network_receive_bytes_total{device="eth0"} 2.009426e+06

vagrant@v:~/node_exporter-1.3.0.linux-amd64$ curl -s localhost:9100/metrics | grep 'node_network_transmit_bytes_total{device="eth0"}'
node_network_transmit_bytes_total{device="eth0"} 4.380297e+06


disk
$ curl -s localhost:9100/metrics | grep node_disk_'read_bytes_total{device="sda"\|written_bytes_total{device="sda"}'

dmesg|grep Hyper
Hypervisor detected: KVM

dmesg |grep DMI
[    0.000000] DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006


Физический
# dmesg | grep DMI
[    0.000000] DMI: IBM System x3650 M4 : -[7915K4G]-/00J6520, BIOS -[VVE124AUS-1.30]- 11/21/2012


VMWare ESXi
# dmesg | grep DMI
[    0.000000] DMI present.


VMWare ESXi
# dmesg | grep DMI
[    0.000000] DMI 2.6 present.
[    0.000000] DMI: VMware, Inc. VMware7,1/440BX Desktop Reference Platform, BIOS VMW71.00V.0.B64.1605280101 05/28/2016

VMWare ESXi
# dmesg | grep yper
[    0.000000] Hypervisor detected: VMware


