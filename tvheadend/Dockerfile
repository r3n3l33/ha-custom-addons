ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8

# Kopiere das Startskript in den Container und mache es ausführbar
COPY run.sh /
RUN chmod a+x /run.sh

# Verwende das Skript als Startpunkt
CMD [ "/run.sh" ]

ENV PUID=0 \
    PGID=0 \
    USER_ID=0 \
    GROUP_ID=0 \
    TZ=Europe/Berlin
