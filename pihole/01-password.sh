#!/bin/bash

# 1. Persistenz & Symlinks einrichten
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

# 2. Passwort direkt in die FTL-Datenbank / pihole.toml injizieren
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    PASSWORD=$(sed -n 's/.*"password": *"\([^"]*\)".*/\1/p' "$CONFIG_PATH")

    if [ -n "$PASSWORD" ]; then
        echo "[INFO] Generiere v6 Passwort-Hash für Pi-hole..."
        
        # Python erzeugt den korrekten PBKDF2/SHA256 Hash für Pi-hole v6
        HASH=$(python3 -c "
import hashlib, os
pwd = '''$PASSWORD'''.encode('utf-8')
salt = os.urandom(16)
pwhash = hashlib.pbkdf2_hmac('sha256', pwd, salt, 10000)
print(salt.hex() + ':' + pwhash.hex())
" 2>/dev/null)

        if [ -n "$HASH" ]; then
            # SQLite-Datenbank vorbereiten falls noch nicht da
            if [ -f /etc/pihole/pihole-FTL.db ]; then
                sqlite3 /etc/pihole/pihole-FTL.db "INSERT OR REPLACE INTO config (key, value) VALUES ('webserver.pwhash', '$HASH');" 2>/dev/null || true
            fi
        fi
        
        # Zusätzlich als Fallback für die CLI setzen
        pihole setpassword "$PASSWORD" <<EOF
$PASSWORD
$PASSWORD
EOF
    fi
fi
