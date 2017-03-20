Clúster Trax. Serveis:
- VM #1 **rproxy** (HAProxy o nginx?)
- VM #2 **public**
    - academia.exo.cat (Drupal)
    - exo.cat (Wordpress)
    - public.exo.cat (gogs.io)
- VM #3 **privada**
    - db.exo.cat (Django Admin)
    - auth.exo.cat LDAP (slapd)
    - OpenVPN (admins)
    - noc.exo.cat/cacti Cacti
    - privat.exo.cat (gogs.io)
    - data.exo.cat
- VM #4 **core**
    - DNS (ns.exo.cat)
    - NTP (ntp.exo.cat)
    - SMTP? (mailer.exo.cat?)
- VM #5 **vrouter** (Mikrotik)
- VM #6 **rt** (Real-Time)
    - meet.guifi.net (jitsi)
    - xat.guifi.net (rocketchat)
    - matrix.exo.cat (matrix)
    - streaming (?) - pública
- VM **shop.exo.cat** (Prestashop)

## HA policy

Volem fer només HA del router virtual, és a dir, que en cas que caigui el Trax que conté el router virtual, arrenqui el router virtual a l'altre Trax

TODO: potser hi ha altres serveis que volem aquest comportament
