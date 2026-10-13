ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8

# Startet Tvheadend mit aktivierter HTTP-Root-Anpassung
CMD [ "tvheadend", "-C", "-u", "root", "-g", "root", "--http_root", "", "--satip_xml", "http://192.168.178.130:9527/desc.xml" ]

# Setzt den tvheadend-Prozess auf ROOT, um Schreibrechte auf Samba-NAS-Shares zu erzwingen
ENV PUID=0 \
    PGID=0 \
    USER_ID=0 \
    GROUP_ID=0 \
    TZ=Europe/Berlin
