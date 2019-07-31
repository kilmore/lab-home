#!/bin/bash


# Copy in DNS files
mv /etc/resolv.conf /etc/resolve.conf_backup
cp /tmp/configs/resolv.conf /etc/resolv.conf
chmod 755 /etc/resolv.conf

cp /tmp/configs/dhclient.conf /etc/dhcp/dhclient.conf 