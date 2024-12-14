ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="stable"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY system_files /
COPY scripts /scripts

RUN \
    mkdir -p /var/lib/alternatives && \
    echo "auth optional pam_exec.so expose_authtok /usr/local/sbin/mount-zfs-encrypted-dir" >> /etc/authselect/system-auth

RUN \
    /scripts/remove_packages.sh && \
    /scripts/install_packages.sh && \
    /scripts/manage_services.sh && \
    ostree container commit
