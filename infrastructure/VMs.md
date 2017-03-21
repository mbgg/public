<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Allocate services in VMs](#allocate-services-in-vms)
- [Disk policy](#disk-policy)
  - [Create](#create)
  - [Resize](#resize)
- [HA policy](#ha-policy)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Allocate services in VMs

Clúster Trax. Serveis:
- VM #1 **rproxy** (HAProxy o nginx?)
- VM #2 **public**
    - academia.exo.cat (Drupal)
    - exo.cat (Wordpress)
    - public.exo.cat (gogs.io)
- VM #3 **privada**
    - db.exo.cat (Django Admin)
    - auth.exo.cat LDAP (slapd)
    - OpenVPN (admins)
    - noc.exo.cat/cacti Cacti
    - privat.exo.cat (gogs.io)
    - data.exo.cat
- VM #4 **core**
    - DNS (ns.exo.cat)
    - NTP (ntp.exo.cat)
    - SMTP? (mailer.exo.cat?)
- VM #5 **vrouter** (Mikrotik)
- VM #6 **rt** (Real-Time)
    - meet.guifi.net (jitsi)
    - xat.guifi.net (rocketchat)
    - matrix.exo.cat (matrix)
    - streaming (?) - pública
- VM **shop.exo.cat** (Prestashop)

## Disk policy

VMs start with a virtio disk with writeback of 4 GB with a msdos partition table and a root partition in `/dev/vda`, no swap. This root partition use xfs. Through this automated [debian preseed installer](https://TODO)

### Create

Expected creations:
- Create new disk
- Create new mountpoint, examples: /tmp, /var, /home
- Create new swap

In all this cases start with a disk of 2 GB and use it entirely without defining a msdos partition table.

xfs is recommended, format it this way:

`mkfs.xfs /dev/vdb`

add it to `/etc/fstab`, for example, for disk `/dev/vdb`:

`echo UUID=$(blkid -s UUID -o value /dev/vdb) /tmp xfs defaults 0 0 >> /etc/fstab`

### Resize

resize root partition

```
# sometimes this command is required to force kernel update partition table
#partprobe /dev/vda
parted /dev/vda resizepart 1 Yes 100%
xfs_grow /path/to/mounted/disk
```

resize other virtual disks (assuming a mounted xfs disk)

`xfs_grow /path/to/mounted/disk`

## HA policy

Most important machines:

- VM #4 **core**
- VM #5 **vrouter**
