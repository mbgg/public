requirement: auxiliar computer with dhcp and http server

simple http server: `python -m SimpleHTTPServer` in the directory where you can find the preseed for a vm, for example rproxy

boot debian netinstall image

GRUB menu: Advanced options -> 64 bit automated install

press TAB

url=http://192.168.95.26:8000/rproxy

at the moment we are using vrouter2 as dhcp server 

# TODO

# 1
insert hostname in preseed -> there is a bug, hostname is not processed

# 2

clean format, something like:

```

TASK: [access-switch | Generate configuration files] ************************** 
changed: [localhost] => (item={'hostname': 'twb-sf-sw1'})
changed: [localhost] => (item={'hostname': 'twb-sf-sw2'})
changed: [localhost] => (item={'hostname': 'twb-sf-sw3'})
changed: [localhost] => (item={'hostname': 'twb-sf-sw4'})
changed: [localhost] => (item={'hostname': 'twb-sf-sw5'})
```

src https://pynet.twb-tech.com/blog/ansible/ansible-cfg-template-p3.html

# 3

try partitionless solution
