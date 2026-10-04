ARG BUILD_FROM=pihole/pihole:latest
FROM ${BUILD_FROM}

ENV TZ="Europe/Berlin" \
    FTLCONF_dns_listeningMode="all" \
    FTLCONF_webserver_port="8081"

# Vorbereitung für persistente Daten
RUN mkdir -p /config/pihole /config/dnsmasq.d \
    && rm -rf /etc/pihole /etc/dnsmasq.d \
    && ln -s /config/pihole /etc/pihole \
    && ln -s /config/dnsmasq.d /etc/dnsmasq.d

# S6-Init Skript für automatische Passwort-Vergabe
COPY 01-password.sh /etc/cont-init.d/01-password.sh
RUN chmod +x /etc/cont-init.d/01-password.sh

EXPOSE 8081 53/tcp 53/udp
