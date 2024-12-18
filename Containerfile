ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="stable"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY system_files /
COPY scripts /scripts

RUN \
    rm /etc/skel/.config/autostart/sb-key-notify.desktop && \
    rm /etc/profile.d/sb-key-notify-autostart.sh && \
    rm /etc/profile.d/ublue-os-just.sh

RUN \
    mkdir -p /var/lib/alternatives && \
    /scripts/remove_packages.sh && \
    /scripts/install_packages.sh && \
    /scripts/manage_services.sh && \
    ostree container commit
