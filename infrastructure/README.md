# TODO

- [ ] LVM on virtual machines? test resize of virtual disk
- [ ] Trax3 s'haurà de dotar d'una targeta de xarxa de 4 ports perquè actualment només disposa d'1 port.

Work in progress with services and VMs

- [services](https://github.com/guifi-exo/public/blob/master/infrastructure/services.md)
- [VMs](https://github.com/guifi-exo/public/blob/master/infrastructure/VMs.md)

# Info

eXO infrastructure is Hyper-converged infrastructure (HCI [[1](https://en.wikipedia.org/wiki/Hyper-converged_infrastructure)] [[2](http://www.helixstorm.com/hyperconverged-infrastructure/)] [[3](https://www.prowesscorp.com/hyper-converged-infrastructure-the-next-data-center-evolution/)]).

- [hardware](https://github.com/guifi-exo/public/blob/master/infrastructure/hardware.md). Migrate this info to yaml?

static yaml database:

- [network](https://github.com/guifi-exo/public/blob/master/infrastructure/db/network.yml)
    - vlan plan
    - IPs of devices
- [storage](https://github.com/guifi-exo/public/blob/master/infrastructure/db/storage.yml): information related to physical disks, at the moment is just `/etc/fstab`


![network diagram](https://github.com/guifi-exo/public/raw/master/infrastructure/diagrams/network_diagram.png)

# Chaos info

Cada trax té 3 interfícies:

- eth0 es dirigeix a un switch
- eth1 es dirigeix a un altre switch
- gestió està connectada a mikrotik/trax3 (ipmi)

eth0 i eth1 fan un bonding, la redundància funciona, i és 1 Gbps round robin (balance-tcp)
