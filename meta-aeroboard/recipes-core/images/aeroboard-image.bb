DESCRIPTION = "Custom AeroBoard image based on core-image-minimal"
LICENSE = "MIT"

require recipes-core/images/core-image-minimal.bb

# Add extra packages on top of core-image-minimal
IMAGE_INSTALL += " \
    openssh \
    net-tools \
    iproute2 \
"