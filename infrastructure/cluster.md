# Cluster

2017-03-02

- Trax1 i Trax2
- Trax3 (Atom)

## Trax1 i Trax2

## Trax3

(Atom)

Les missions del Trax3 són:

- Backup fora del gluster
- Node d'arbitratge del proxmox
- Gestió del cluster

### Backup fora del gluster

### Node d'arbitratge del proxmox

### Gestió regular

Trax3 proveeix d'accés de gestió als nodes del clúster Trax1 i Trax2.

Trax3 tindrà una connexió a la `vlan 102` (FXOLN) amb una IPv4 pública.

La FXOLN ha d'inserir una ruta /32 en aquesta IP i serà d'ús exclusiu del clúster.

Trax3 una ruta a Internet a través d'aquesta vlan i s'identificarà amb aquesta IPv4.

Trax3 tindrà accés a la vlan100 (alias ctrl) a la qual estaran connectats Trax1 i Trax2 en forma de NAT (gateway).

Trax3 tindrà un servei OpenVPN per tal d'accedir a tot el clúster.

També tindrà una connexió directe amb IPMI de Trax1 i Trax2.

Trax3 s'haurà de dotar d'una targeta de xarxa de 4 ports perquè actualment només disposa d'1 port.
