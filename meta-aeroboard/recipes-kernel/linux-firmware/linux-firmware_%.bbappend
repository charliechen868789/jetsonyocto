FILESEXTRAPATHS:prepend := "${THISDIR}/file:"

SRC_URI:append = " \
    file://iwlwifi-8265-21.ucode \
    file://iwlwifi-8265-22.ucode \
    file://iwlwifi-8265-27.ucode \
    file://iwlwifi-8265-31.ucode \
"

do_install:append() {
    install -d ${D}${nonarch_base_libdir}/firmware
    install -m 0644 ${WORKDIR}/iwlwifi-8265-*.ucode ${D}${nonarch_base_libdir}/firmware/
}