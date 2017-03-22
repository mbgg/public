requirement: auxiliar computer with dhcp and http server

simple http server: `python -m SimpleHTTPServer` in the directory where you can find the preseed for a vm, for example rproxy

boot debian netinstall image

GRUB menu: Advanced options -> 64 bit automated install

press TAB

url=http://192.168.95.26:8000/rproxy

at the moment we are using vrouter2 as dhcp server 
