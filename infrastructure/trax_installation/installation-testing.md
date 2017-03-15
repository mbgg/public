<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Guió d'instal·lació del eXOpve1](#gui%C3%B3-dinstal%C2%B7laci%C3%B3-del-exopve1)
  - [Fitxers de configuració de xarxa i hosts](#fitxers-de-configuraci%C3%B3-de-xarxa-i-hosts)
    - [/etc/network/interfaces {#interfaces}](#etcnetworkinterfaces-interfaces)
    - [/etc/hosts {#hosts}](#etchosts-hosts)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Servidors

# Guió d'instal·lació del eXOpve1


Provisonalment usem `eth0` per fer la instal·lació, aprofito el dhcp per arrancar i faig el canvi a una ip fixe que el proxmox li agrada més

instal·lar el repo de jessie backports

`
echo "deb http://ftp.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list.d/jessie-backports.list
`

instal·lar el repo de megaraid

```
wget -O - https://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key | apt-key add -
echo "deb http://hwraid.le-vert.net/debian jessie main" > /etc/apt/sources.list.d/hwraid.list
```

instalar eines

```
apt-get update
apt-get install ssh smartmontools megacli mtr iftop
```

instalar el repo de proxmox

```
wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -
echo "deb http://download.proxmox.com/debian jessie pve-no-subscription" > /etc/apt/sources.list.d/pve-non-subscription.list
```

refrescar els repos i actualitzar: `apt-get update && apt-get dist-upgrade`

**IMPORTANT**: afegir la ip del interface `eth0` (provisional) al fitxer `/etc/hosts` en lloc de la loopback abans de instalar els paquets proxmox. En el nostre cas canviar `127.0.1.1 eXOpve1` per `192.168.200.91 eXOpve1` (en altre node `192.168.200.92 eXOpve2`)

```
apt-get install proxmox-ve ssh postfix ksm-control-daemon open-iscsi systemd-sysv openvswitch-switch
apt-get remove os-prober
update-grub
```

reiniciar (cal canviar al kernel just acabat d'instal·lar): `reboot`

Comprovar que el entorn proxmox és operatiu des de un navegador https://192.168.200.91:8006


Configurar el fitxer [/etc/network/interfaces](#interfaces) per usar el OVS sobre `eth1`, amb vlan 96 per el servei proxmox i vlan 97 per el servei gluster. La vlan 96 es per fer el live migration en el clúster proxmox. La vlan 97 es per fer la rèplica del glusterfs.

Configurar el fitxer [/etc/hosts](#hosts) amb les ip's del segment dedicat als serveis pve: `192.168.96.91   eXOpve1` i `192.168.96.92   eXOpve2` en els dos nodes igual 

Reiniciar (cal reconfigurar la xarxa i la configuració general del proxmox)

comprovar que el timesync està funcionant: fonamental per el cluster proxmox i el gluster: `systemctl status time-sync.target`

crear el cluster proxmox que li diem eXOpve, **IMPORTANT** això només s'ha de fer una vegada en el primer node, MAI en els dos a risc de crear dos cluster independents

`pvcme create eXOpve`

comprovar que està funcionant

`pvcme status`

en el altre equip fer: `pvecm add eXOpve1`. **IMPORTANT** només s'ha de fer una vegada en el segon node quan el cluster ja està creat en el primer node

comprovar que el cluster té quorom i dos nodes: `pvcme status`

reiniciar (els dos nodes): `reboot`

comprovar que el cluster té quorom i dos nodes: `pvcme status`

Instal·lar darrera revisió glusterfs versió 3.8, ja que la 3.9 acaba de sortir 

```
wget -O - http://download.gluster.org/pub/gluster/glusterfs/3.8/LATEST/rsa.pub | apt-key add -
echo deb http://download.gluster.org/pub/gluster/glusterfs/3.8/LATEST/Debian/jessie/apt jessie main > /etc/apt/sources.list.d/gluster.list
apt-get update
```

Cal el servidor i el client en aquest cas. Sino hi han bricks en el node només cal el client:

`apt-get install glusterfs-server glusterfs-client`


Crear els bricks amb LVM i XFS. Per tal de preveure possibles ampliacions fem dos parts del 50% del espai disponible. Com que tenim un RAID5 amb 2 dics de dades i 1 de paritat tenim que alinear amb 2(discs de dades)x128k(tamany bloc gluster)
pvcreate --dataalignment 256k /dev/sdb 

comprovació

`pvs -o +pe_start /dev/sdb`
  
Creació del vg dedicat als bricks de gluster amb el tamany apropiat de cada extent igual que l'alineació

`vgcreate --physicalextentsize 256k vg1 /dev/sdb`

Creació dels dos bricks del 50% de capacitat cadascun

```
lvcreate -l 50%VG -n brick1 vg1
lvcreate -l 50%VG -n brick2 vg1
```

format XFS amb espai en els inodes de 512bytes per elks extended attributes del gluster amb tamany de bloc XFS a 8192 per disminuir els iops al accedir als inodes. Ajust al RAID5 amb segments de 128k i dos discs de dades

```
mkfs.xfs -f -i size=512 -n size=8192 -d su=128k,sw=2 /dev/vg1/brick1
mkfs.xfs -f -i size=512 -n size=8192 -d su=128k,sw=2 /dev/vg1/brick2
```

creació dels punts de muntatge dels bricks

```
mkdir /brick1
mkdir /brick2
```

mount amb l'opció inode64 recomanada per grans tamanys (més de 1 TB) i noatime (no guardis el timestamp d'accés, atime: access time) (nodiratime pot ser també interessant; accés a directoris) per millor performance

```
mount -t xfs -o inode64,noatime /dev/vg1/brick1 /brick1
mount -t xfs -o inode64,noatime /dev/vg1/brick2 /brick2
```

determinar el UUID dels dos bricks i afegir-ho al /etc/fstab

`blkid`

segons el resultat del UUID cal afegir al /etc/fstab dues línies com les del eXOpve1 per exemple:

```
echo "UUID=a1ca0a7c-781b-4720-aa26-761c2f872ea7       /brick1 xfs     inode64,noatime 0       0" >>/etc/fstab
echo "UUID=96046a9a-bc3e-4e7a-94d2-0aceedd3e4fc       /brick2 xfs     inode64,noatime 0       0" >>/etc/fstab
```

cal definir a /etc/hosts els noms i les ip's corresponents als nodes gluster sobre el segment vlan 97:

```
echo "192.168.97.91 gfs01" >>/etc/hosts
echo "192.168.97.92 gfs02" >>/etc/hosts
```

recomanat reiniciar per comprovar que tot es queda correctament: `reboot`

comprovar que els briks estan muntats al seu lloc després del reinici

`df -h`

registrar el node company al gluster

`gluster peer probe gfs02`

comprovar que el estat del altre node es correcte

`gluster peer status`

o també:

`gluster pool list`

preparar la creació de un volum distribuit-replicat entre els dos nodes que li direm vmstore

```
mkdir /brick1/vmstore
mkdir /brick2/vmstore
```

crear el volum gluster vmstore amb dos bricks de cada node replicats entre ells

`gluster volume create vmstore replica 2 transport tcp gfs01:/brick1/vmstore gfs02:/brick1/vmstore gfs01:/brick2/vmstore gfs02:/brick2/vmstore`

no cal els servei nfs de gluster, millor usar el del kernel si cal

`gluster volume set vmstore nfs.disable on`

permetre el sharding per tal de manegar fitxers molt grans de forma balancejada i amb self-heal el més ràpid possible

```
gluster volume set vmstore features.shard enable
gluster volume set vmstore features.shard-block-size 512MB
gluster volume set vmstore data-self-heal-algorithm full
```

ajustar paràmetres del gluster per el entorn de virtualització

```
gluster volume set vmstore performance.readdir-ahead off
gluster volume set vmstore performance.quick-read off
gluster volume set vmstore performance.read-ahead off
gluster volume set vmstore cluster.readdir-optimize on
gluster volume set vmstore performance.quick-read off
gluster volume set vmstore performance.read-ahead off
gluster volume set vmstore performance.io-cache off
gluster volume set vmstore performance.stat-prefetch off
```

nota: per veure totes les opcions, feu `gluster volume get vmstore all | less`

arrancar el volum gluster vmstore: `gluster volume start vmstore`

reiniciar: `reboot`

comprovar estat: `gluster volume status`

Definir el nou `vmstore` com a tipus GlusterFS en el servidors `gfs01` i `gfs02` en el interfase web de proxmox

Per a que no doni error al fer updates cal comentar la linia del repo `/etc/apt/sources.list.d/pve-enterprise.list`

## Fitxers de configuració de xarxa i hosts

### /etc/network/interfaces {#interfaces}

```
# network interface settings; autogenerated
# Please do NOT modify this file directly, unless you know what
# you're doing.
#
# If you want to manage part of the network configuration manually,
# please utilize the 'source' or 'source-directory' directives to do
# so.
# PVE will preserve these directives, but will NOT its network
# configuration from sourced files, so do not attempt to move any of
# the PVE managed interfaces into external files!

source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

allow-hotplug eth0

iface eth0 inet static
        address  192.168.200.91
        netmask  255.255.255.0
        gateway  192.168.200.254


allow-vmbr0 eth1
iface eth1 inet manual
        ovs_type OVSPort
        ovs_bridge vmbr0

iface eth2 inet manual

iface eth3 inet manual

auto vmbr0
allow-ovs vmbr0
iface vmbr0 inet manual
        ovs_type OVSBridge
        ovs_ports eth1 pve gfs

allow-vmbr0 pve
iface pve inet static
        address  192.168.96.91
        netmask  255.255.255.0
        ovs_type OVSIntPort
        ovs_bridge vmbr0
        ovs_options tag=96

allow-vmbr0 gfs
iface gfs inet static
        address  192.168.97.91
        netmask  255.255.255.0
        ovs_type OVSIntPort
        ovs_bridge vmbr0
        ovs_options tag=97
```

### /etc/hosts {#hosts}

```
127.0.0.1       localhost
192.168.96.91   eXOpve1
192.168.96.92   eXOpve2

192.168.97.91   gfs01
192.168.97.92   gfs02

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
