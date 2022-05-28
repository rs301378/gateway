#Append script for tdx-reference minimal
#ARV
#Toradex
#Layer meta-de

SYSTEMD_DEFAULT_TARGET = "graphical.target"

IMAGE_FEATURES += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', \
       bb.utils.contains('DISTRO_FEATURES',     'x11', 'x11', \
                                                       '', d), d)} \
"


IMAGE_INSTALL += " \
    python3 \
    nano \
    opencv \
    python3-sqlite3 \
    python3-paho-mqtt \
    python3-requests \
    packagegroup-tdx-cli \
    packagegroup-tdx-graphical \
    packagegroup-fsl-isp \
    bash \
    coreutils \
    less \
    makedevs \
    mime-support \
    util-linux \
    v4l-utils \
    gpicview \
    media-files \
    motion-detection \
    modemmanager \
    networkmanager \
    iftop \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-omx \
"

IMAGE_INSTALL_remove = " connman"
IMAGE_INSTALL_remove = " connman-client"
IMAGE_INSTALL_remove = " connman-gnome"
IMAGE_INSTALL_remove = " connman-plugin-wifi"
IMAGE_INSTALL_remove = " connman-plugin-ethernet"
IMAGE_INSTALL_remove = " connman-plugin-loopback"
PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"

change_mod() {
        ln -nsf /usr/share/zoneinfo/Asia/Kolkata ${IMAGE_ROOTFS}/etc/localtime   
}

ROOTFS_POSTPROCESS_COMMAND += "change_mod; "
