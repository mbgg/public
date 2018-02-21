put this as an static db file

Note: Inverse chronological order

# 2018-02

changelog: replace trax3 server

## trax1 and trax2

Trax1 and Trax2 (Trabla Asus Xeon) are expected to have this way 8 redundant _good_ VMs, and up to 16. _Good_ VMs are considered to have 16 GB disk capacity and 8 GB de RAM.
- Shared chassis: Travla C147 (check manuals directory), Mini-ITX for two motherboards, 2x250W. 0.5 U
    - Misc. Disk options:
        - 2.5'' HD (x2)
        - 3.5'' HD (x1)

Each node (2):

- Motherboard: [Asus P10S-I](http://dlcdnet.asus.com/pub/ASUS/mb/socket1151/P10S-I/Manual/E13687_P10S-I_UM_V5_WEB.pdf). Socket 1151. Mini-ITX
- CPU: [Intel Xeon E3-1220V5](https://ark.intel.com/products/88172/Intel-Xeon-Processor-E3-1220-v5-8M-Cache-3_00-GHz) 4CORE BOX 3.0GHZ 8MB LGA1151
- RAM: 16GB 2Rx8 2G x 64-Bit PC4-2133 CL15 288-Pin DIMM 115,00 4 460,00
- Disks: [Intel Solid-State Drive DC S3610](https://www.intel.com/content/www/us/en/products/memory-storage/solid-state-drives/data-center-ssds/dc-s3610-series.html) 200GB SATA 6Gb/s 7mm 2.5"
    - Spec: http://www.intel.com/content/www/us/en/solid-state-drives/ssd-dc-s3610-spec.html
- CPU Fan: [Dynatron K199G 115X Rack 1U Activo](http://www.dynatron-corp.com/?product=k199)
- Extra: Module [ASMB8-iKVM IPMI 2.0 Management Upgrade Kit with KVM](https://www.asus.com/us/Commercial-Servers-Workstations/ASMB7IKVM/) for IPMI access
    - Manual: http://dlcdnet.asus.com/pub/ASUS/server/accessory/ASMB8/E10970_ASMB8-iKVM_UM_V2_WEB.pdf?_ga=1.24437948.746187932.1462889111

- Router: [Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)

## trax3

trax 3 differs on processor, disks and chassis:

- Chassis: [SC505-1U](http://www.supermicro.com/manuals/chassis/1U/SC505.pdf) Supermicro SuperChassis 505-203B 9.8" depth small form factor 1U, 200W. Gold level power supply, Optimized for Mini-ITX (6.75"x 6.75"), Motherboard, Front I/O Ports
- Motherboard: [Asus P10S-I](http://dlcdnet.asus.com/pub/ASUS/mb/socket1151/P10S-I/Manual/E13687_P10S-I_UM_V5_WEB.pdf). Socket 1151. Mini-ITX
- CPU: [Intel Xeon E3-1220V6](https://ark.intel.com/products/88172/Intel-Xeon-Processor-E3-1220-v6-8M-Cache-3_00-GHz) 4CORE BOX 3.0GHZ 8MB LGA1151
- RAM: 16GB 2Rx8 2G x 64-Bit PC4-2133 CL15 288-Pin DIMM 115,00 4 460,00
- CPU Fan: [Dynatron K199G 115X Rack 1U Activo](http://www.dynatron-corp.com/?product=k199)
- Extra: Module [ASMB8-iKVM IPMI 2.0 Management Upgrade Kit with KVM](https://www.asus.com/us/Commercial-Servers-Workstations/ASMB7IKVM/) for IPMI access
    - Manual: http://dlcdnet.asus.com/pub/ASUS/server/accessory/ASMB8/E10970_ASMB8-iKVM_UM_V2_WEB.pdf?_ga=1.24437948.746187932.1462889111

# rest of 2017

## trax1 and trax2

Trax1 and Trax2 (Trabla Asus Xeon) are expected to have this way 8 redundant _good_ VMs, and up to 16. _Good_ VMs are considered to have 16 GB disk capacity and 8 GB de RAM.
- Shared chassis: Travla C147 (check manuals directory), Mini-ITX for two motherboards, 2x250W. 0.5 U
    - Misc. Disk options:
        - 2.5'' HD (x2)
        - 3.5'' HD (x1)

Each node (2):

- Motherboard: [Asus P10S-I](http://dlcdnet.asus.com/pub/ASUS/mb/socket1151/P10S-I/Manual/E13687_P10S-I_UM_V5_WEB.pdf). Socket 1151. Mini-ITX
- CPU: [Intel Xeon E3-1220V5](https://ark.intel.com/products/88172/Intel-Xeon-Processor-E3-1220-v5-8M-Cache-3_00-GHz) 4CORE BOX 3.0GHZ 8MB LGA1151
- RAM: 16GB 2Rx8 2G x 64-Bit PC4-2133 CL15 288-Pin DIMM 115,00 4 460,00
- Disks: [Intel Solid-State Drive DC S3610](https://www.intel.com/content/www/us/en/products/memory-storage/solid-state-drives/data-center-ssds/dc-s3610-series.html) 200GB SATA 6Gb/s 7mm 2.5"
    - Spec: http://www.intel.com/content/www/us/en/solid-state-drives/ssd-dc-s3610-spec.html
- CPU Fan: [Dynatron K199G 115X Rack 1U Activo](http://www.dynatron-corp.com/?product=k199)
- Extra: Module [ASMB8-iKVM IPMI 2.0 Management Upgrade Kit with KVM](https://www.asus.com/us/Commercial-Servers-Workstations/ASMB7IKVM/) for IPMI access
    - Manual: http://dlcdnet.asus.com/pub/ASUS/server/accessory/ASMB8/E10970_ASMB8-iKVM_UM_V2_WEB.pdf?_ga=1.24437948.746187932.1462889111

- Router: [Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)
- Server
    - CPU: [Intel Atom D525](https://ark.intel.com/products/49490)
    - RAM: 4 GiB
    - Motherboard: [Intel D525MW](http://ark.intel.com/products/48952/Intel-Desktop-Board-D525MW)
    - Disks: HGST 465 GiB and WDC 465 GiB


# As of 2017-02-21

- Router: [Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)
- Server
    - CPU: [Intel Atom D525](https://ark.intel.com/products/49490)
    - RAM: 4 GiB
    - Motherboard: [Intel D525MW](http://ark.intel.com/products/48952/Intel-Desktop-Board-D525MW)
    - Disks: HGST 465 GiB and WDC 465 GiB
