# Serveis

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

## matrix

requeriments:
- com es faria integració ldap amb guifi
- si hi ha alguna característica important que perdem de rocketchat, especialment de comoditat pels usuaris més relaxats
- sé que es poden enllaçar rocketchat i matrix; el tema es fer-ho possible de veritat. així doncs, la migració no seria tant greu. hi hauria un període que funcionarien tots dos
