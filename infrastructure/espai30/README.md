# Distribució

- Rang estàtiques: `10.1.193.3-10.1.193.49`, separació conceptual:
    - 1-10 equips de xarxa
    - 11-20 equips cluster
    - 21-49 VMs a Espai30

- Rang dinàmiques `10.1.193.50-10.1.193.254`

Draft: Pels maquinaris cluster, deixem les .111, .112 pels BMC. I les .11 .12 per l'altre IP de l'equipament cluster

# Maquinari

| màquina | IP | model |
| ------- | -- | ----- |
| qMp | 10.1.193.1 | Nanostation M5 Loco |
| LEDE? | 10.1.193.2 | Unifi LiteAC |
| SW1 | 10.1.193.3 | tplink T1600G-28TS 1.0 |
| SW2 | 10.1.193.4 | tplink TL-SG2424 2.0 |
| SW3 | 10.1.193.48 | DELL (pendent de passar a 10.1.193.5) |
| APC | 10.1.193.10 | SMX2200RMHV2U |
| e30pve1 | 10.1.193.11 | ? |
| e30pve2 | 10.1.193.12 | ? |
| e30pve3 | 10.1.193.13 | ? |
| e30pve4 | 10.1.193.14 | ? |
| servidor vell espai30 | 10.1.193.21 | VM |
