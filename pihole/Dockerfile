ARG BUILD_FROM=pihole/pihole:latest
FROM ${BUILD_FROM}

ENV TZ="Europe/Berlin" \
    FTLCONF_dns_listeningMode="all" \
    FTLCONF_webserver_port="8081"

EXPOSE 8081 53/tcp 53/udp
