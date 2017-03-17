Clúster Trax. Serveis:
- VM **rproxy** (HAProxy o nginx?)
- VM **public**
    - academia.exo.cat (Drupal)
    - exo.cat (Wordpress)
    - public.exo.cat (gogs.io)
- VM **privada**
    - db.exo.cat (Django Admin)
    - auth.exo.cat LDAP (slapd)
    - OpenVPN
    - noc.exo.cat/cacti Cacti
    - privat.exo.cat (gogs.io)
    - data.exo.cat
- VM **shop.exo.cat** (Prestashop)
- VM **rt** (Real-Time)
    - meet.guifi.net (jitsi)
    - xat.guifi.net (rocketchat)
    - matrix.exo.cat (matrix)
    - streaming (?) - pública
- VM **vrouter** (Mikrotik)
- VM **core**
    - DNS (ns.exo.cat)
    - NTP (ntp.exo.cat)
    - SMTP? (mailer.exo.cat?)

## HA policy

Volem fer només HA del router virtual, és a dir, que en cas que caigui el Trax que conté el router virtual, arrenqui el router virtual a l'altre Trax

TODO: potser hi ha altres serveis que volem aquest comportament
