#!/usr/bin/with-contenv bash

# Liest den Wert aus der Home-Assistant-Konfiguration aus
SATIP_URL=$(bashio::config 'satip_xml_url')

ARGS=("-C" "-u" "root" "-g" "root" "--http_root" "")

# Wenn eine URL angegeben wurde, füge den Parameter hinzu
if [ -n "$SATIP_URL" ]; then
    ARGS+=("--satip_xml" "$SATIP_URL")
    echo "Starte Tvheadend mit SAT>IP XML: $SATIP_URL"
else
    echo "Starte Tvheadend im Standard-Modus (ohne feste XML)"
fi

# Tvheadend starten
exec tvheadend "${ARGS[@]}"
