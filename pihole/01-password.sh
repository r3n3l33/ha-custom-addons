#!/bin/bash

# 1. Ordner auf dem Host vorbereiten
mkdir -p /config/pihole /config/dnsmasq.d

# 2. Symlinks setzen, falls nicht vorhanden
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

# 3. Passwort nach FTL-Start setzen (im Hintergrund)
(
    # Warten bis FTL hochgefahren ist und auf Port 8081/API hört
    sleep 5

    CONFIG_PATH=/data/options.json
    if [ -f "$CONFIG_PATH" ]; then
        # Robustes Auslesen aus der options.json
        PASSWORD=$(sed -n 's/.*"password": *"\([^"]*\)".*/\1/p' "$CONFIG_PATH")

        if [ -n "$PASSWORD" ]; then
            echo "[INFO] Synchronisiere Pi-hole Web-Passwort aus HAOS-Konfiguration..."
            pihole setpassword "$PASSWORD"
        fi
    fi
) &
