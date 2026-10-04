#!/bin/bash

# Passwort aus der Home Assistant options.json auslesen (benötigt jq)
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    PASSWORD=$(jq --raw-output '.password // empty' $CONFIG_PATH)
    
    if [ -n "$PASSWORD" ]; then
        echo "[INFO] Setze Pi-hole Web-Passwort aus HAOS-Konfiguration..."
        pihole setpassword "$PASSWORD"
    fi
fi

# Übergabe an das originale Pi-hole Start-Skript
exec /s6-init
