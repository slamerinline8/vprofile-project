#!/bin/bash
sudo yum install epel-release -y
sudo yum install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached
sudo memcached -p 11211 -U 11111 -u memcached -d

# Firewall
systemctl enable firewalld
systemctl start firewalld
systemctl status firewalld
firewall-cmd --add-port=11211/tcp --permanent
firewall-cmd --reload
systemctl restart firewalld
systemctl restart memcached