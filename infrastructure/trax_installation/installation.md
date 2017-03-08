# Installation 2017-03-07

vàrios processos en paral·lel (més paral·lelitzable): xfs
un usuari: ext4

- boot 8.7 64 bit install
- primary partitions
    - 1 swap 4096 MB (swap)
    - 2 root 16384 MB (xfs, label: root, mount options: noatime, bootable flag)
    - brick (rest) MB
    - debian repo: ftp2.de.debian.org

trax1: 192.168.1.11
trax2: 192.168.1.12

`vi /etc/systemd/timesyncd.conf`
```
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.
#
# See timesyncd.conf(5) for details

[Time]
Servers=10.228.203.104
````

restart:

`service systemd-timesyncd restart`

checker:

`service systemd-timesyncd status`

`apt-get install ipmitool inxi smartmontools ethtool ssh`

`sensors-detect`

`sensors`

`apt-get install tcpdump iperf3`

`apt-get install iotop iftop`

TODO

- `apt-get install nmap mtr sudo`
- no funciona `ipmitool`

INFO

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

