#!/bin/bash

# Ordner auf dem Host vorbereiten
mkdir -p /config/pihole /config/dnsmasq.d

# Symlinks setzen, falls nicht vorhanden
if [ ! -L /etc/pihole ]; then
    if [ -z "$(ls -A /config/pihole 2>/dev/null)" ]; then
        cp -rp /etc/pihole/* /config/pihole/ 2>/dev/null || true
    fi
    rm -rf /etc/pihole
    ln -s /config/pihole /etc/pihole
fi

if [ ! -L /etc/dnsmasq.d ]; then
    if [ -z "$(ls -A /config/dnsmasq.d 2>/dev/null)" ]; then
        cp -rp /etc/dnsmasq.d/* /config/dnsmasq.d/ 2>/dev/null || true
    fi
    rm -rf /etc/dnsmasq.d
    ln -s /config/dnsmasq.d /etc/dnsmasq.d
fi
