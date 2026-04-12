DESCRIPTION = "AeroBoard image with Qt5, OpenCV, TFLite, ONNX, CUDA"
LICENSE = "MIT"

require recipes-core/images/core-image-minimal.bb

# Qt5
IMAGE_INSTALL += " \
    qtbase \
    qtbase-plugins \
    qtbase-tools \
    qtdeclarative \
    qtdeclarative-qmlplugins \
    qtmultimedia \
    qtmultimedia-plugins \
    qtquickcontrols2 \
    qtgraphicaleffects \
    fontconfig \
    liberation-fonts \
    ttf-dejavu-sans \
"

# OpenCV with DNN
IMAGE_INSTALL += " \
    opencv \
    python3-opencv \
"

# Tegra CUDA + GPU libraries
IMAGE_INSTALL += " \
    tegra-libraries-core \
    tegra-libraries-cuda \
    tegra-libraries-eglcore \
    tegra-libraries-glescore \
    tegra-libraries-gbm \
    tegra-libraries-multimedia \
    tegra-libraries-multimedia-utils \
    tegra-libraries-multimedia-v4l \
    cuda-cudart \
    cuda-libraries \
"

# GStreamer + camera
IMAGE_INSTALL += " \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    v4l-utils \
    libv4l \
"

# Python + utilities
IMAGE_INSTALL += " \
    python3 \
    python3-numpy \
    python3-pip \
    openssh \
    net-tools \
    iproute2 \
    i2c-tools \
    bash \
    htop \
"
IMAGE_INSTALL_remove = "opencv python3-opencv"

TOOLCHAIN_HOST_TASK:append = " \
    nativesdk-packagegroup-qt5-toolchain-host \
    nativesdk-cmake \
"

TOOLCHAIN_TARGET_TASK:append = " \
    packagegroup-qt5-toolchain-target \
"
# Enable Qt SDK support
inherit populate_sdk_qt5

# Qt5
IMAGE_INSTALL += " \
    qtbase \
    qtbase-plugins \
    qtbase-tools \
    qtdeclarative \
    qtdeclarative-qmlplugins \
    qtmultimedia \
    qtmultimedia-plugins \
    qtquickcontrols2 \
    qtgraphicaleffects \
    fontconfig \
    liberation-fonts \
    ttf-dejavu-sans \
"

IMAGE_INSTALL_append = " rsync"