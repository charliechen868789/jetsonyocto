# meta-aeroboard/recipes-gui/gui-app-init/gui-app-init.bb

SUMMARY = "Init script for gui-app Qt eglfs startup"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://gui-app-init.sh"

S = "${WORKDIR}"

RDEPENDS:${PN} = "gui-app"

inherit update-rc.d

INITSCRIPT_NAME = "gui-app"
INITSCRIPT_PARAMS = "defaults 99"

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/gui-app-init.sh \
        ${D}${sysconfdir}/init.d/gui-app
}