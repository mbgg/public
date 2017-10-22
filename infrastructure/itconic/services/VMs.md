<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Allocate services in VMs](#allocate-services-in-vms)
- [HA policy](#ha-policy)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

check debian template & operations at https://github.com/guifi-exo/wiki/blob/master/howto/debianVM.md

## Allocate services in VMs

Clúster Trax. Serveis:
- VM #1 **rproxy** (nginx)
- VM #2 **publica**
    - academia.exo.cat (Drupal)
    - exo.cat (Wordpress)
    - public.exo.cat (gogs.io)
- VM #3 **privada**
    - db.exo.cat (Django Admin)
    - privat.exo.cat (gogs.io)
    - data.exo.cat
- VM #4 **core**
    - DNS (ns1.exo.cat)
    - NTP (ntp.exo.cat)
    - SMTP? (mailer.exo.cat?)
    - noc.exo.cat/cacti Cacti
    - auth.exo.cat LDAP (slapd)
- VM #5 **vrouter1** (Mikrotik)
- VM #6 **vrouter2** (VyOS)
    - give VMs temp access to Internet
    - OpenVPN (admins)
    - research routing capabilities of VyOS (if it can replace mikrotik)
- VM #7 **rt** (Real-Time)
    - meet.guifi.net (jitsi)
    - xat.guifi.net (rocketchat)
    - matrix.exo.cat (matrix)
    - streaming (?) - pública
- VM #8 **secon** (Client1)
- VM #9 **vpn.exo.cat** (OpenVPN)

other IDs:

- proxmox: 1 -> 121
- IPs: 1 -> 192.168.x.21

## HA policy

Most important machines that require High Availability:

- VM #4 **core**
- VM #5 **vrouter**
