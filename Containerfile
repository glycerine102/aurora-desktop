ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="stable-20250713"

FROM scratch AS ctx
COPY build /

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY rootfs /

RUN \
    rm /etc/skel/.config/autostart/sb-key-notify.desktop && \
    rm /etc/skel/.local/share/flatpak/overrides/com.google.Chrome && \
    mkdir -p /var/lib/alternatives && \
    ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

ARG SANOID_URL="https://github.com/decoyjoe/sanoid-portable/releases/download/2.2.0-2/sanoid-portable"
ARG SANOID_DIR="/usr/local/sbin"
RUN \
    wget ${SANOID_URL} -O ${SANOID_DIR}/sanoid-portable && \
    chmod +x ${SANOID_DIR}/sanoid-portable && \
    sh ${SANOID_DIR}/sanoid-portable --assimilate && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/sanoid && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/syncoid && \
    ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/findoid

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/remove_packages.sh && \
    /ctx/install_packages.sh && \
    /ctx/manage_services.sh && \
    ostree container commit
