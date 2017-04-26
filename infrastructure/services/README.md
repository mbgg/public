Work in progress with services and VMs

[preseed](https://github.com/guifi-exo/public/tree/master/infrastructure/services/preseed) is a way to automate initial installations

- [VMs](https://github.com/guifi-exo/public/blob/master/infrastructure/vms/VMs.md)
    - allocate services in VMs
    - disk policy
    - ha policy
    
each exposed public IP has its own [firewall](https://github.com/guifi-exo/public/blob/master/infrastructure/services/firewall.md)

# Serveis

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [virtual routing](#virtual-routing)
- [reverse proxy](#reverse-proxy)
- [academia.exo.cat](#academiaexocat)
- [exo.cat](#exocat)
- [public.exo.cat](#publicexocat)
- [db.exo.cat](#dbexocat)
- [noc.exo.cat](#nocexocat)
- [privat.exo.cat](#privatexocat)
- [data.exo.cat](#dataexocat)
- [shop.exo.cat](#shopexocat)
- [meet.guifi.net](#meetguifinet)
- [xat.guifi.net](#xatguifinet)
- [matrix.exo.cat](#matrixexocat)
- [fw.exo.cat](#fwexocat)
- [vpn.exo.cat](#vpnexocat)
- [apt.exo.cat](#aptexocat)
- [extra (review needed)](#extra-review-needed)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## virtual routing

es decideix que no VRRP, s'utilitza HA del cluster proxmox

## reverse proxy

reverse proxy: haproxy

gestió de certificats: certbot (letsencrypt)

Port | Servei | Descripció
---- | ------ | ----------
80/tcp | HTTP | força sempre redirecció a 443
443/tcp | HTTPS | SSL reverse proxy

reverse proxy i gestió de certificats:
- academia.exo.cat
- exo.cat
- public.exo.cat
- db.exo.cat
- noc.exo.cat
- privat.exo.cat
- data.exo.cat
- shop.exo.cat

només gestió de certificats (a revisar)
- meet.guifi.net
- xat.guifi.net
- matrix.exo.cat

## academia.exo.cat

software: drupal

## exo.cat

software: wordpress

- reduïr número de plugins; que sigui fàcil tenir-lo a la última versió
- agafar el calendari de data.exo.cat i incrustar-lo

## public.exo.cat

software: gogs.io

tot lo que hi ha al github ara (public, doc), github es convertiria llavors en un mirror d'aquest repositori

## db.exo.cat

software: django admin

informació integrada

https://github.com/guifi-org/exoadmin

## noc.exo.cat

software: cacti

- en un futur es pot plantejar tenir també weathermap, smokeping

## privat.exo.cat

software: gogs.io

repositoris que contenen informació personal

## data.exo.cat

software: nextcloud

- calendari eXO
- gestió de documents personals

## shop.exo.cat

software: prestashop

## meet.guifi.net

software: jitsi-meet

## xat.guifi.net

software: rocketchat

## matrix.exo.cat

software: matrix + riot

requeriments:
- com es faria integració ldap amb guifi
- si hi ha alguna característica important que perdem de rocketchat, especialment de comoditat pels usuaris més relaxats
- sé que es poden enllaçar rocketchat i matrix; el tema es fer-ho possible de veritat. així doncs, la migració no seria tant greu. hi hauria un període que funcionarien tots dos

## fw.exo.cat

firmware compiler. FTP directory: Images for qMp, OpenWRT, Lede, etc.

would be nice to have one based on templated system of ansible

## vpn.exo.cat

Dial-up connection for people that wants encrypted Internet through guifi. This also could include external access to guifi.

## apt.exo.cat

objective: save internet bandwidth

apt cacher, this way you download each debian package one time

## extra (review needed)

- [HTTPS](service-https) (English) - com fer HTTPs amb Letsencrypt per als nostres serveis
- [rocketchat](service-rocketchat) - com fer un rocketchat
- [meet-jitsi](service-meet-jitsi) - com fer un meet jitsi
- [speedtest](service-speedtest) - Autor: Oriol. codi font no publicat
- [El rosco de Llorenç](http://dsg.ac.upc.edu/qmpmon) - monitor de xarxes mesh qMp. Autor: Llorenç. codi font no publicat
- [Mapes qMp de Barcelona](http://sants.guifi.net/maps) - Autor: Oriol. [codi font](https://github.com/xarbot/guifimaps)
