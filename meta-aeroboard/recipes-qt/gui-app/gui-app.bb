SUMMARY = "Qt QML GUI App"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.md;md5=c5f2c510ba6da2b6ac36dec14b07d785"

SRC_URI = "git://github.com/charliechen868789/gui-app.git;branch=main;protocol=https \
           file://gui-app.service"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit qmake5 systemd

DEPENDS += "qtbase qtdeclarative qtquickcontrols2"

SYSTEMD_SERVICE:${PN} = "gui-app.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 gui-app ${D}${bindir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/gui-app.service ${D}${systemd_system_unitdir}
}