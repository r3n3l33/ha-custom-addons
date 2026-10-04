ARG BUILD_FROM=pihole/pihole:latest
FROM ${BUILD_FROM}

# jq für JSON-Parsing installieren
RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*

ENV TZ="Europe/Berlin" \
    FTLCONF_dns_listeningMode="all" \
    FTLCONF_webserver_port="8081"

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8081 53/tcp 53/udp

CMD [ "/run.sh" ]
