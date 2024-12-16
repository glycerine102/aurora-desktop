ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="stable"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY system_files /
COPY scripts /scripts

RUN \
    echo "auth       optional    libshavee_pam.so storage/secrets" >> /etc/pam.d/sddm && \
    echo "session    optional    libshavee_pam.so storage/secrets" >> /etc/pam.d/sddm 

RUN \
    mkdir -p /var/lib/alternatives && \
    /scripts/remove_packages.sh && \
    /scripts/install_packages.sh && \
    /scripts/manage_services.sh && \
    ostree container commit
