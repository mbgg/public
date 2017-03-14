use `./genconf.sh` to generate configuration for trax1 and trax2

example of how to copy config files to nodes: `rsync -av -e ssh trax2/etc/ trax2:/etc/`

warning/note/help/fixme: rsync uses user instead of root (this changes permissions on /etc)

# things being used

For IPs we have this flexibility: http://docs.ansible.com/ansible/playbooks_filters_ipaddr.html#getting-information-from-host-prefix-values
