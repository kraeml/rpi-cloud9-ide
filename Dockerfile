# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM hypriot/rpi-node:7.4
MAINTAINER Michael Schaar <kraeml@sesamestreet.franken.de>

CMD ["node"]

# ------------------------------------------------------------------------------
# Get cloud9 source and install
RUN git clone https://github.com/c9/core.git /cloud9 && \
    cd /cloud9 && scripts/install-sdk.sh

WORKDIR /cloud9

# ------------------------------------------------------------------------------
# Add workspace volumes
RUN mkdir /cloud9/workspace
VOLUME /cloud9/workspace

# ------------------------------------------------------------------------------
# Set default workspace dir
ENV C9_WORKSPACE /cloud9/workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 8181
EXPOSE 3000
