#!/bin/bash

scp core:/etc/network/interfaces core/etc/network/
scp core:/etc/systemd/system/bind9.service core/etc/systemd/system/
scp -r core:/etc/bind/ core/etc/

scp rproxy:/etc/network/interfaces rproxy/etc/network/
scp rproxy:/etc/haproxy/haproxy.cfg rproxy/etc/haproxy/
