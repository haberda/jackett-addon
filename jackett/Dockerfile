ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base/amd64:7.1.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG JACKETT_RELEASE=v0.21.987

# environment settings
ENV XDG_DATA_HOME="/data" \
    XDG_CONFIG_HOME="/data"

# Setup base
RUN apt-get update && apt-get install -y \
    coreutils \
    nginx \
    openvpn

# Make folders
RUN \
  mkdir -p /app/Jackett && \
  mkdir -p /build/ && \
  mkdir -p /data/

# Install jackett
RUN \
  if [ -z ${JACKETT_RELEASE+x} ]; then \
	JACKETT_RELEASE=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" \
	| jq -r .tag_name); \
  fi && \ 
  if [ $BUILD_ARCH = "armv7" ]; then \
    curl -o /build/jacket.tar.gz -L https://github.com/Jackett/Jackett/releases/download/${JACKETT_RELEASE}/Jackett.Binaries.LinuxARM32.tar.gz; \
  elif [ $BUILD_ARCH = "aarch64" ]; then \
    curl -o /build/jacket.tar.gz -L https://github.com/Jackett/Jackett/releases/download/${JACKETT_RELEASE}/Jackett.Binaries.LinuxARM64.tar.gz; \
  else \
    curl -o /build/jacket.tar.gz -L https://github.com/Jackett/Jackett/releases/download/${JACKETT_RELEASE}/Jackett.Binaries.LinuxAMDx64.tar.gz; \
  fi 

RUN tar xf /build/jacket.tar.gz -C /app/Jackett --strip-components=1 

# cleanup
RUN rm -rf /build/*

# add local files
COPY root /

RUN ["chmod", "+x", "/etc/openvpn/up-jackett.sh"]

#RUN addgroup -g 1000 jackett && \
#    adduser -S -D -H -u 1000 jackett -G users jackett

RUN useradd -u 911 -U -d /config -s /bin/false abc && \
    usermod -G users abc 

RUN chmod -R +x /etc/cont-init.d/

RUN chmod -R +x /etc/s6-overlay/

RUN chmod -R +x /etc/services.d/

RUN chmod -R +x /etc/openvpn/

# ports and volumes
VOLUME /data /share /config
#EXPOSE 9117

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="jackett" \
    io.hass.description="jackett" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    maintainer="haberda" \
    org.label-schema.description="jackett" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="jackett" \
    org.label-schema.schema-version="${BUILD_VERSION}" \
    org.label-schema.url="https://github.com/haberda/jackett-addon" \
    org.label-schema.usage="https://github.com/haberda/jackett-addon" \
    org.label-schema.vcs-ref="${BUILD_REF}" \
    org.label-schema.vcs-url="https://github.com/haberda/" \
    org.label-schema.vendor="No Vendor"
