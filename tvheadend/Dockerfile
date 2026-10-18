ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8

# Startet Tvheadend direkt mit der festen SAT>IP XML-Adresse unter rootDescr
CMD [ "tvheadend", "-C", "-u", "root", "-g", "root", "--http_root", "", "--satip_xml", "http://192.168.178.130/rootDescr" ]

ENV PUID=0 \
    PGID=0 \
    USER_ID=0 \
    GROUP_ID=0 \
    TZ=Europe/Berlin
