FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://extlinux.conf"

do_deploy_append() {
    install -d ${DEPLOYDIR}/extlinux
    install -m 0644 ${WORKDIR}/extlinux.conf ${DEPLOYDIR}/extlinux/extlinux.conf
    install -m 0644 ${WORKDIR}/extlinux.conf ${DEPLOYDIR}/extlinux.conf
}
