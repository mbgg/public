<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [2018-02](#2018-02)
  - [trax1 and trax2](#trax1-and-trax2)
  - [trax3](#trax3)
  - [router](#router)
- [rest of 2017](#rest-of-2017)
  - [trax1 and trax2](#trax1-and-trax2-1)
  - [trax3](#trax3-1)
  - [router](#router-1)
- [As of 2017-02-21](#as-of-2017-02-21)
  - [router](#router-2)
  - [server](#server)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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
    - CPU Fan: [Dynatron K199G 115X Rack 1U Activo](http://www.dynatron-corp.com/?product=k199)
- RAM: 16GB 2Rx8 2G x 64-Bit PC4-2133 CL15 288-Pin DIMM 115,00 4 460,00
- Disks:
    - [Intel Solid-State Drive DC S3610](http://www.intel.com/content/www/us/en/solid-state-drives/ssd-dc-s3610-spec.html) 200GB SATA 6Gb/s 7mm 2.5"
    - Hardisk [Seagate ST2000NX0253](http://store.supermicro.com/hard-drive/2-5/2tb-hdd-2t2000-st2000nx0253.html) - 2 TB - 2.5" - SATA - 7200rpm - 128 MB Buffer
- Extra: Module [ASMB8-iKVM IPMI 2.0 Management Upgrade Kit with KVM](https://www.asus.com/us/Commercial-Servers-Workstations/ASMB7IKVM/) for IPMI access
    - Manual: http://dlcdnet.asus.com/pub/ASUS/server/accessory/ASMB8/E10970_ASMB8-iKVM_UM_V2_WEB.pdf?_ga=1.24437948.746187932.1462889111

## trax3

trax 3 differs on processor, disks and chassis:

- Chassis: [SC505-1U](http://www.supermicro.com/products/chassis/1U/505/SC505-203B) [manual](http://www.supermicro.com/manuals/chassis/1U/SC505.pdf) Supermicro SuperChassis 505-203B 9.8" depth small form factor 1U, 200W. Gold level power supply, Optimized for Mini-ITX (6.75"x 6.75"), Motherboard, Front I/O Ports
- Motherboard: [Asus P10S-I](http://dlcdnet.asus.com/pub/ASUS/mb/socket1151/P10S-I/Manual/E13687_P10S-I_UM_V5_WEB.pdf). Socket 1151. Mini-ITX
- CPU: [Intel Xeon E3-1220V6](https://ark.intel.com/products/88172/Intel-Xeon-Processor-E3-1220-v6-8M-Cache-3_00-GHz) 4CORE BOX 3.0GHZ 8MB LGA1151
    - CPU Fan: [Dynatron K199G 115X Rack 1U Activo](http://www.dynatron-corp.com/?product=k199)
- RAM: 16GB 2Rx8 2G x 64-Bit PC4-2133 CL15 288-Pin DIMM 115,00 4 460,00
- Disks: 2 x [Hitachi Ultrastar He12](https://www.hgst.com/products/hard-drives/ultrastar-he12) 12TB 256MB 3.5 SATA/600 7200RPM x 2
- Extra: Module [ASMB8-iKVM IPMI 2.0 Management Upgrade Kit with KVM](https://www.asus.com/us/Commercial-Servers-Workstations/ASMB7IKVM/) for IPMI access
    - Manual: http://dlcdnet.asus.com/pub/ASUS/server/accessory/ASMB8/E10970_ASMB8-iKVM_UM_V2_WEB.pdf?_ga=1.24437948.746187932.1462889111

## router

[Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)

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

## trax3

- CPU: [Intel Atom D525](https://ark.intel.com/products/49490)
- RAM: 4 GiB
- Motherboard: [Intel D525MW](http://ark.intel.com/products/48952/Intel-Desktop-Board-D525MW)
- Disks: HGST 465 GiB and WDC 465 GiB

## router

[Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)


# As of 2017-02-21

## router

[Mikrotik RB1100AHx2](https://routerboard.com/RB1100AHx2)

## server

- CPU: [Intel Atom D525](https://ark.intel.com/products/49490)
- RAM: 4 GiB
- Motherboard: [Intel D525MW](http://ark.intel.com/products/48952/Intel-Desktop-Board-D525MW)
- Disks: HGST 465 GiB and WDC 465 GiB
