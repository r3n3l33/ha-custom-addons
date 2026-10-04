#!/bin/bash

CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    # Liest den "password"-Wert direkt aus options.json
    PASSWORD=$(grep -o '"password": "[^"]*' "$CONFIG_PATH" | grep -o '[^"]*$')

    if [ -n "$PASSWORD" ]; then
        echo "[INFO] Setze Pi-hole Web-Passwort aus HAOS-Konfiguration..."
        pihole setpassword "$PASSWORD"
    fi
fi
