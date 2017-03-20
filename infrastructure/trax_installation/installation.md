<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation 2017-03-07](#installation-2017-03-07)
  - [debian installation](#debian-installation)
  - [first configurations](#first-configurations)
  - [previous steps before cluster installation](#previous-steps-before-cluster-installation)
    - [cluster networking](#cluster-networking)
    - [time synchronization](#time-synchronization)
  - [install proxmox](#install-proxmox)
    - [first steps](#first-steps)
    - [create cluster](#create-cluster)
      - [ipmi and proxmox high availability](#ipmi-and-proxmox-high-availability)
      - [extra1: recreate/reinitialize cluster](#extra1-recreatereinitialize-cluster)
      - [extra2: problem adding node](#extra2-problem-adding-node)
  - [install gluster as redundant shared storage for proxmox](#install-gluster-as-redundant-shared-storage-for-proxmox)
    - [first steps](#first-steps-1)
    - [join nodes](#join-nodes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Installation 2017-03-07

## debian installation

- boot 8.7 64 bit install
- primary partitions in `/dev/sda`
    - /dev/sda1 swap 4096 MB (swap)
    - /dev/sda2 root 16384 MB (xfs, label: root, mount options: noatime, bootable flag)
    - brick (rest) MB
    - debian repo: ftp2.de.debian.org

## first configurations

check that you have `/etc/network/interfaces` as in configuration (at this moment, we only need access to internet)

in our case:
```
trax1: 192.168.1.11/24
trax2: 192.168.1.12/24
gateway: 192.168.1.1/24
```
Put jessie backports, check `/etc/apt/sources.list`

check that you have `/etc/systemd/timesyncd.conf` as in configuration

change as said in configuration files

restart:

`service systemd-timesyncd restart`

checker:

`service systemd-timesyncd status`

install utilities:

`apt-get install ipmitool inxi smartmontools ethtool ssh tcpdump iperf3 iotop iftop nmap mtr sudo parted curl tmux screen vim etckeeper`

detect sensors

`sensors-detect`

check sensors work

`sensors`

## previous steps before cluster installation

### cluster networking

before we start clusters check that you have `/etc/network/interfaces` and `/etc/hosts` as in configuration

VLAN 96 is for proxmox service, specially, for its live migration operation

VLAN 97 is for gluster service, specially for replica operation

If you can reach your nodes via HTTTP check availability of proxmox web management application. Example for our trax1: https://192.168.96.11:8006

This network configuration requires reboot. If you are working remotely, be sure what you do or you will loose access.

### time synchronization

Check that timesync is working, it is fundamental for proxmox and gluster clusters:

`systemctl status time-sync.target`

Try to select the closest NTP server you can

## install proxmox

### first steps

add proxmox repository

`wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -`

check that you have `/etc/apt/sources.list.d` as in configuration

`apt-get update && apt-get dist-upgrade`

**IMPORTANT**: change from loopback to the ip of the temporal/principal network interface in the file `/etc/hosts` this way (example): `127.0.1.1 trax1` per `192.168.96.11 eXOpve1`. Check configuration of `/etc/hosts`

Install proxmox (mail: no configuration):
```
apt-get install proxmox-ve ssh postfix ksm-control-daemon systemd-sysv openvswitch-switch

apt-get remove os-prober
update-grub
```

`reboot` to use the new kernel

after installing proxmox, delete the repository it creates:

`rm /etc/apt/sources.list.d/pve-enterprise.list`

### create cluster

Create cluster proxmox, in our case (from trax1):

`pvcme create trax`

**IMPORTANT** create only one cluster and only in the first node, if you do this more times in the others you can create independent clusters!

Check that is working:

`pvecm status`

In the other node (trax2), add with the hostname of the other node that have the cluster:

`pvecm add trax1`

Check that the cluster is running correctly now and after reboot:

```
pvcme status
reboot
pvcme status
```

extra: https://pve.proxmox.com/wiki/Proxmox_VE_4.x_Cluster

#### ipmi and proxmox high availability

With IPMI there is high availability in proxmox cluster out of the box. (src https://pve.proxmox.com/wiki/High_Availability_Cluster_4.x)

By default ipmi was not working, we needed to load the modules. Check template of `/etc/modules`. This reference helped: http://serverfault.com/questions/480371/ipmitool-cant-find-dev-ipmi0-or-dev-ipmidev-0/480374#480374

#### extra1: recreate/reinitialize cluster

Sometime you will need to recreate the proxmox cluster

In my case following the guide, I put the first node in cluster with the wrong IP in `/etc/hosts`. After putting the right IP it said:

```
pvecm status
Cannot initialize CMAP service
```

so I deleted this way:

```
systemctl stop pvestatd.service
systemctl stop pvedaemon.service
systemctl stop pve-cluster.service
rm -rf /var/lib/pve-cluster
rm -rf /etc/corosync
rm /etc/ssh/ssh_known_hosts
systemctl start pvestatd.service
systemctl start pvedaemon.service
systemctl start pve-cluster.service
```

after that said:

```
pvecm status
Corosync config '/etc/pve/corosync.conf' does not exist - is this node part of a cluster?
Cannot initialize CMAP service
```

If your problem is somehow different but similar, check official guide: https://pve.proxmox.com/wiki/Proxmox_VE_4.x_Cluster#Re-installing_a_cluster_node

#### extra2: problem adding node

This command failed:

```
pvecm add trax1
unable to copy ssh ID: exit code 1
```

Because in `/etc/hosts` of trax2 was missing the entry for trax1:

`192.168.96.11    trax1`

## install gluster as redundant shared storage for proxmox

### first steps

add gluster repository (check `/etc/apt/sources.list.d` in config)

`wget -O - http://download.gluster.org/pub/gluster/glusterfs/LATEST/rsa.pub | apt-key add -`

install latest stable version of gluster server and client (3.8 at the moment)

`apt-get install glusterfs-server glusterfs-client`

preparing bricks: create a primary partition. Last partition was in 20.5GB according to command `parted /dev/sda p` so we do:

`parted /dev/sda mkpart primary 20.5GB 100%`

and prepare new partition /dev/sda3 as brick for gluster. Format it as XFS partition with 512bytes of size for inodes for the extended attributes of gluster and blocksize of 8192 to minimize iops to access inodes

`mkfs.xfs -f -i size=512 -n size=8192  /dev/sda3`

create mount point for brick1

`mkdir /brick1`

get UUID (use `blkid`) of /dev/sda3 to mount it as /brick1 and add it to `/etc/fstab` (check configuration of this file in template). Test the new mount point with the following command:

`mount -a`

Check XFS is OK:

`xfs_info /brick1`

### join nodes

from one of your nodes, register the other one. For example from trax1 we register gfs2:

`gluster peer probe gfs1`

No worries: if trax1 registers gfs1, has no effect, is localhost

Check if gluster is working with these two commands:

```
gluster peer status
gluster pool list
```

in each node node prepare bricks for gluster volume , in our case:

```
mkdir /brick1/vmstore
```

**Note**: now gluster nodes are interconnected; hence, the next commands can be done in one of the nodes and this information will be propagated

create a replicated gluster volume, in our case:

`gluster volume create vmstore replica 2 transport tcp gfs1:/brick1/vmstore gfs2:/brick1/vmstore`

apply this customizations

note: shard block size should be 64MB for less than 1TB. [In the other example, we used 512MB](https://github.com/guifi-exo/public/blob/master/infrastructure/trax_installation/installation-testing.md)

```
# is preferred to use the nfs from linux kernel
gluster volume set vmstore nfs.disable on
# sharding to manage balanced big files and fast self-heal
gluster volume set vmstore features.shard enable
gluster volume set vmstore features.shard-block-size 64MB
gluster volume set vmstore data-self-heal-algorithm full
# parameters to optimize virtualization
gluster volume set vmstore cluster.readdir-optimize on
gluster volume set vmstore performance.io-cache off
gluster volume set vmstore performance.quick-read off
gluster volume set vmstore performance.readdir-ahead off
gluster volume set vmstore performance.read-ahead off
gluster volume set vmstore performance.stat-prefetch off
```

check gluster volume options:

`gluster volume get vmstore all | less`

start gluster volume, in our case:

`gluster volume start vmstore`

`reboot` and check that gluster volume is working correctly:

`gluster volume status`

as you disabled nfs on gluster, you have to configure storage by config file

put next text as `/etc/pve/storage.cfg` in one of the nodes. As `/etc/pve` is distributed amonst proxmox nodes, this information will be replicated immediately.

```
dir: local
        disable
        path /var/lib/vz
        maxfiles 0
        content images,rootdir,vztmpl,iso

glusterfs: vmstore
        volume vmstore
        path /mnt/pve/vmstore
        content backup,images,iso,vztmpl
        maxfiles 5
        server 127.0.0.1
```

src https://pve.proxmox.com/wiki/Storage#_storage_configuration
