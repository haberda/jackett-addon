FROM linuxserver/jackett:v0.17.780-ls25

LABEL io.hass.version="ls25" io.hass.type="addon" io.hass.arch="armhf|aarch64|amd64"

ENV XDG_DATA_HOME="/data" \
XDG_CONFIG_HOME="/data"

# modify/copy files

RUN sed -i "s|config|data|g" /etc/cont-init.d/*

VOLUME ["/share", "/ssl", "/data", "/media"]
