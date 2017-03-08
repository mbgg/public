# Installation 2017-03-07

## debian installation

- boot 8.7 64 bit install
- primary partitions
    - 1 swap 4096 MB (swap)
    - 2 root 16384 MB (xfs, label: root, mount options: noatime, bootable flag)
    - brick (rest) MB
    - debian repo: ftp2.de.debian.org

## first configurations

check that you have `/etc/network/interfaces` as in configuration

in our case:
```
trax1: 192.168.1.11/24
trax2: 192.168.1.12/24
gateway: 192.168.1.1/24
```

check that you have `/etc/systemd/timesyncd.conf` as in configuration

change as said in configuration files

restart:

`service systemd-timesyncd restart`

checker:

`service systemd-timesyncd status`

install utilities

`apt-get install ipmitool inxi smartmontools ethtool ssh tcpdump iperf3 iotop iftop nmap mtr sudo parted`

detect sensors

`sensors-detect`

check sensors work

`sensors`

## proxmox installation

We need two repositories:

- jessie backports
- proxmox repository

`wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -`

check that you have `/etc/apt/sources.list` as in configuration

`apt-get update && apt-get dist-upgrade`

**IMPORTANT**: change from loopback to the ip of the temporal/principal network interface in the file `/etc/hosts` this way (example): `127.0.1.1 eXOpve1` per `192.168.200.91 eXOpve1`. Check configuration of `/etc/hosts`

Install proxmox (mail: no configuration):
```
apt-get install proxmox-ve ssh postfix ksm-control-daemon open-iscsi systemd-sysv openvswitch-switch

apt-get remove os-prober
update-grub
```

`reboot` to use the new kernel

after installing proxmox, delete the repository it creates:

`rm /etc/apt/sources.list.d/pve-enterprise.list`

## gluster installation

install latest stable version of gluster (3.8 at the moment)

install gluster server and client

`apt-get install glusterfs-server glusterfs-client`

create a primary partition. Last partition was in 20.5GB according to command `parted /dev/sda p` so we do:

`parted /dev/sda mkpart primary 20.5GB 100%`

and prepare volume for gluster. Format an XFS partition with 512bytes of size for inodes forthe extended attributes of gluster and blocksize of 8192 to minimize iops to access inodes

`mkfs.xfs -f -i size=512 -n size=8192  /dev/sda3`

```
## final network config

Comprovar que el entorn proxmox és operatiu des de un navegador https://192.168.200.91:8006

Configurar el fitxer /etc/network/interfaces per usar el OVS sobre eth1, amb vlan 96 per el servei proxmox i vlan 97 per el servei gluster. La vlan 96 es per fer el live migration en el clúster proxmox. La vlan 97 es per fer la rèplica del glusterfs.

Configurar el fitxer /etc/hosts amb les ip's del segment dedicat als serveis pve: 192.168.96.91 eXOpve1 i 192.168.96.92 eXOpve2 en els dos nodes igual

## proxmox cluster installation

Reiniciar (cal reconfigurar la xarxa i la configuració general del proxmox)

comprovar que el timesync està funcionant: fonamental per el cluster proxmox i el gluster: systemctl status time-sync.target

crear el cluster proxmox que li diem eXOpve, IMPORTANT això només s'ha de fer una vegada en el primer node, MAI en els dos a risc de crear dos cluster independents

pvcme create eXOpve

comprovar que està funcionant

pvcme status

en el altre equip fer: pvecm add eXOpve1. IMPORTANT només s'ha de fer una vegada en el segon node quan el cluster ja està creat en el primer node

comprovar que el cluster té quorom i dos nodes: pvcme status

reiniciar (els dos nodes): reboot

comprovar que el cluster té quorom i dos nodes: pvcme status

# TODO: template config that generates specific config for cluster members

# TODO: no funciona `ipmitool`

# TODO: Move to another doc section

no muntar cluster proxmox i gluster fins tenir IPs definitives

gluster necessita extended attributes (per això ho posem al xfs)

benchmark

throughput ssd trax1
```
dd if=/dev/zero of=/kk bs=1024k count=4k conv=fsync
4096+0 records in
4096+0 records out
4294967296 bytes (4.3 GB) copied, 19.4548 s, 221 MB/s
```
ext4 vs xfs

vàrios processos en paral·lel (més paral·lelitzable): xfs
un usuari: ext4



do partition one liner

parted

sfdisk

src http://serverfault.com/questions/258152/fdisk-partition-in-single-line
