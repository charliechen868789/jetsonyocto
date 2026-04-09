# Enable linuxfb platform plugin
PACKAGECONFIG_append = " linuxfb fontconfig freetype"
# Disable xcb/X11 if you don't need it (optional, reduces size)
# PACKAGECONFIG_remove = "xcb"
PACKAGECONFIG:append:pn-qtdeclarative = " softwarecontext"