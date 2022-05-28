#Replacing mount.sh script with custom script 

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://mount.sh "
               

do_install_append() {
    install -d ${D}${sysconfdir}/udev/scripts/
    install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
}

