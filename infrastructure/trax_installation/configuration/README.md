use `./genconf.sh` to generate configuration for trax1 and trax2

use `./deploy.sh` to deploy these configurations to trax1 and trax2

# things being used

For IPs we have this flexibility: http://docs.ansible.com/ansible/playbooks_filters_ipaddr.html#getting-information-from-host-prefix-values

# TODO

- [ ] Use a closer NTP server. [current](https://github.com/guifi-exo/public/blob/master/infrastructure/trax_installation/configuration/template/etc/systemd/timesyncd.conf)
- [ ] Use a closer DNS server. [current](https://github.com/guifi-exo/public/blob/master/infrastructure/trax_installation/configuration/template/etc/resolv.conf)
- [ ] Proxmox HA
