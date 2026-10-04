ARG BUILD_FROM=pihole/pihole:latest
FROM ${BUILD_FROM}

ENV TZ="Europe/Berlin" \
    FTLCONF_dns_listeningMode="all" \
    FTLCONF_webserver_port="8081"

# S6-Init Skript für Persistenz und Passwortkopieren
COPY 01-password.sh /etc/cont-init.d/01-password.sh
RUN chmod +x /etc/cont-init.d/01-password.sh

EXPOSE 8081 53/tcp 53/udp
