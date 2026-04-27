FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI += " \
    file://aeroboard-drm.cfg \
    file://bt.cfg \
"

KERNEL_CONFIG_FRAGMENTS += "aeroboard-drm.cfg"

# 🔥 CRITICAL: force fragment override priority
KCONFIG_MODE = "--alldefconfig"

TARGET_CC_ARCH += "-Wno-error=implicit-function-declaration -Wno-error=int-conversion"