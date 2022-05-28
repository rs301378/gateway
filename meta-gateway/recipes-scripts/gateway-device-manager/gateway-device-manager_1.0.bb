
SUMMARY = "Gateway Device Manager"
DESCRIPTION = "Device manager flask HTTP web server deployed on Apache2 to configure gateway device"
HOMEPAGE = "https://github.com/ScratchnestMPU/Gateway-Device-Manager.git"
LICENSE = "CLOSED"


SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/ScratchnestMPU/Gateway-Device-Manager.git;protocol=git;branch=master"

inherit allarch

S = "${WORKDIR}/git"

do_compile(){
}

do_install_append(){
	install -d ${D}${datadir}/apache2/default-site/htdocs/gdm
	cp -r ${S}/* ${D}${datadir}/apache2/default-site/htdocs/gdm

}


FILES_${PN} += "${datadir}/*"
