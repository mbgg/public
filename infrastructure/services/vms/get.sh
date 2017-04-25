#!/bin/bash

scp core:/etc/network/interfaces core/etc/network/
scp core:/etc/systemd/system/bind9.service core/etc/systemd/system/
scp -r core:/etc/bind/ core/etc/
scp core:/etc/firewall core/etc/

scp rproxy:/etc/network/interfaces rproxy/etc/network/
scp rproxy:/etc/haproxy/haproxy.cfg rproxy/etc/haproxy/
scp rproxy:/etc/firewall rproxy/etc/
scp -r rproxy:/etc/nginx/sites-available rproxy/etc/nginx
scp -r rproxy:/etc/nginx/sites-enabled rproxy/etc/nginx
scp -r rproxy:/etc/default/sslh/ rproxy/etc/default/
