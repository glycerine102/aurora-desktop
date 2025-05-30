ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="stable-20250528.2"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY rootfs /
COPY scripts /scripts

RUN \
    rm /etc/skel/.config/autostart/sb-key-notify.desktop

ARG SANOID_URL="https://github.com/decoyjoe/sanoid-portable/releases/download/2.2.0-2/sanoid-portable"
ARG SANOID_DIR="/usr/local/sbin"
RUN \
    wget ${SANOID_URL} -O ${SANOID_DIR}/sanoid-portable && \
    chmod +x ${SANOID_DIR}/sanoid-portable && \
    sh ${SANOID_DIR}/sanoid-portable --assimilate && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/sanoid && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/syncoid && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/findoid

RUN \
    mkdir -p /var/lib/alternatives && \
    /scripts/remove_packages.sh && \
    /scripts/install_packages.sh && \
    /scripts/manage_services.sh && \
    ostree container commit
