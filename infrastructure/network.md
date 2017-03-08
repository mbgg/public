# Networking

## Pla de VLANs amb FXOLN

Estats de les VLANs:

- Provisional: en fase de disseny, pendent d'aprovar disseny, pendent de demanar a FXOLN
- Assignada: aplicada per XFOLN; preparada per utilitzar
- En producció: en ús

Estat | VID | Codi | Descripció | Subnet
----- | ------- | ---- | ---------- | ------
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
Assignada | 128 | operador | ens la dona FXOLN no sabem per què serveix
