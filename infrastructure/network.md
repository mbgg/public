# Networking

## Pla de VLANs amb FXOLN

Estats de les VLANs:

- Provisional: en fase de disseny, pendent d'aprovar disseny, pendent de demanar a FXOLN
- Assignada: aplicada per XFOLN; preparada per utilitzar
- En producció: en ús

Estat | VID | Codi | Descripció | Subnet
----- | --- | ---- | ---------- | ------
En producció | 90 | gfilan | guifi LAN (accés des de guifi) | 10.38.140.224/27
En producció | 91 | gfiptp1 | troncal per wifi amb Alambra | 172.25.38.208/29
En producció | 92 | gfiptp2 | troncal per wifi amb Ermita | 172.25.45.8/29
En producció | 93 | gfiptp3 | troncal per wifi amb Can Bruixa | 172.25.40.64/30
En producció | 10 | gfiptp4 | troncal amb FXOLN (BGP de 10.0.0.0/8) | 172.25.34.48/30
En producció | 102 | ix | Internet Exchange amb FXOLN | 10.253.4.0/22
Assignada | 94 | inetsrv | servers accessibles des d'Internet | 192.168.94.0/24
Assignada | 95 | rproxy | concentrador de HTTPS (reverse proxy, etc) | 192.168.95.0/24
Assignada | 96 | pve | tràfic clúster proxmox | 192.168.96.0/24
Assignada | 97 | gfs | tràfic clúster gluster | 192.168.97.0/24
Assignada | 98 | ctrl | control, gestió | 192.168.98.0/24
Assignada | 128 | operador | la dona FXOLN, no sabem per què serveix | -

## Pla de VLANs internes

Estat | VID | Codi | Descripció | Subnet
----- | --- | ---- | ---------- | ------
Assignada | 127 | ipmi | VLAN interna de IPMI | 192.168.127.0/24

## Adreçament IPs en el maquinari

### trax1

VID | vmbr0 | ipmi | gateway | notes
--- | ----- | ---- | ------- | -----
96 | 192.168.96.11/24 | - | - | -
97 | 192.168.97.11/24 | - | - | -
98 | 192.168.98.11/24 | - | 192.168.98.13 | -
127 | - | 192.168.127.11/24 | - | vlan interna, connectada a mikrotik/trax3

### trax2

VID | vmbr0 | ipmi | gateway | notes
--- | ----- | ---- | ------- | -----
96 | 192.168.96.12/24 | - | - | -
97 | 192.168.97.12/24 | - | - | -
98 | 192.168.98.12/24 | - | 192.168.98.13 | -
127 | - | 192.168.127.12/24 | - | vlan interna, connectada a mikrotik/trax3

### mikrotik (provisional)

VID | vmbr0 | ipmi | gateway | notes
--- | ----- | ---- | ------- | -----
102 | 10.253.4.28/22 | - | 10.253.4.21 | -
127 | - | 192.168.127.13/24 | - | vlan interna, connectada a mikrotik/trax3

### trax3

VID | loopback | vmbr0 | ipmi | gateway | notes
--- | -------- | ----- | ---- | ------- | -----
96 | 192.168.96.13/24 | - | - | -
97 | 192.168.97.13/24 | - | - | -
98 | 192.168.98.13/24 | - | 192.168.98.13 | -
102 | 10.253.4.29/22 | 10.253.4.21 | - | pendent de confirmar amb FXOLN
127 | - | 192.168.127.13/24 | - | - | vlan interna, connectada a mikrotik/trax3
- | 109.69.10.96 | - | - | loopback


### VMs?

## Gateways

De situació temporal a situació definitiva

trax1 i trax2 surten per Mikrotik a través de VLAN98

després ho faran per atom (trax3) a travé de la mateixa VLAN98

la justificació d'això és que no trobem eficient que vagi de la màquina host a la màquina virtual de routing per tornar a sortir al host
