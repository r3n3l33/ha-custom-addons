#!/bin/bash

# 1. Persistenz für Pi-hole Ordner einrichten
mkdir -p /config/pihole /config/dnsmasq.d

# Falls /etc/pihole noch ein echtes Verzeichnis ist (nicht verlinkt):
if [ ! -L /etc/pihole ]; then
    # Erste Einrichtung: Standard-Konfigurationen sichern, falls /config leer ist
    if [ -z "$(ls -A /config/pihole)" ]; then
        cp -rp /etc/pihole/* /config/pihole/ 2>/dev/null || true
    fi
    rm -rf /etc/pihole
    ln -s /config/pihole /etc/pihole
fi

# Falls /etc/dnsmasq.d noch ein echtes Verzeichnis ist:
if [ ! -L /etc/dnsmasq.d ]; then
    if [ -z "$(ls -A /config/dnsmasq.d)" ]; then
        cp -rp /etc/dnsmasq.d/* /config/dnsmasq.d/ 2>/dev/null || true
    fi
    rm -rf /etc/dnsmasq.d
    ln -s /config/dnsmasq.d /etc/dnsmasq.d
fi

# 2. Passwort aus options.json setzen
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    PASSWORD=$(grep -o '"password": "[^"]*' "$CONFIG_PATH" | grep -o '[^"]*$')

    if [ -n "$PASSWORD" ]; then
        echo "[INFO] Setze Pi-hole Web-Passwort aus HAOS-Konfiguration..."
        pihole setpassword "$PASSWORD"
    fi
fi
