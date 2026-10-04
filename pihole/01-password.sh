#!/bin/bash

# 1. Symlinks & Pfade vorbereiten
mkdir -p /config/pihole /config/dnsmasq.d

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

# 2. Passwort aus options.json lesen & direkt per CLI setzen (synchron)
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    PASSWORD=$(sed -n 's/.*"password": *"\([^"]*\)".*/\1/p' "$CONFIG_PATH")

    if [ -n "$PASSWORD" ]; then
        echo "[INFO] Setze Pi-hole Web-Passwort..."
        
        # Pi-hole v6 erlaubt das direkte Setzen via pihole-FTL CLI
        pihole setpassword "$PASSWORD" < /dev/null || true
    fi
fi
