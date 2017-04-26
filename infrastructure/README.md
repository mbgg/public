# Info

Go to [services](https://github.com/guifi-exo/public/tree/master/infrastructure/services) if you want to know what services and how they are hosted with virtual machines

eXO uses hyper-converged infrastructure (HCI [[1](https://en.wikipedia.org/wiki/Hyper-converged_infrastructure)] [[2](http://www.helixstorm.com/hyperconverged-infrastructure/)] [[3](https://www.prowesscorp.com/hyper-converged-infrastructure-the-next-data-center-evolution/)]).

- [hardware](https://github.com/guifi-exo/public/blob/master/infrastructure/hardware.md). Migrate this info to yaml?

static yaml database:

- [network](https://github.com/guifi-exo/public/blob/master/infrastructure/db/network.yml)
    - vlan plan
    - IPs of devices
- [storage](https://github.com/guifi-exo/public/blob/master/infrastructure/db/storage.yml): information related to physical disks, at the moment is just `/etc/fstab`


![network diagram](https://github.com/guifi-exo/public/raw/master/infrastructure/diagrams/network_diagram.png)

# Security

## Access

VPN access is always a requirement, after that SSH key and/or master password

## Requeriments

- que els hosts (proxmox) i el iKVM no estiguin a la mateixa VLAN
- trax3 i vrouter han de tenir firewall
- que les VMs no puguin accedir als hosts directament
- els routers (virtuals o no) són els únics que tenen accés a hctrl i vctrl


- firewall config: tot lo que vingui de la 98 cap a dins -> DROP

# Backup

backups de trax1, trax2 cap a trax3 amb nfs per la vlan de pve

# Chaos info

Cada trax té 3 interfícies:

- eth0 es dirigeix a un switch
- eth1 es dirigeix a un altre switch
- gestió està connectada a mikrotik/trax3 (ipmi)

eth0 i eth1 fan un bonding, la redundància funciona, i és 1 Gbps round robin (balance-tcp)
