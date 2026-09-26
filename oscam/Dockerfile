ARG BUILD_FROM=lscr.io/linuxserver/oscam:latest
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# copy local files
COPY root/ /


# Ports and volumes
EXPOSE 8888
EXPOSE 9999

VOLUME /config
