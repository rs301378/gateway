#Recipe to load flask gateway web Manager

DESCRIPTION = "Scripts developed"
SECTION = "gateway-mgr"

LICENSE = "CLOSED"


SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/ScratchnestMPU/Server_Gateway_Config.git;protocol=git;branch=main"

inherit allarch

S = "${WORKDIR}/git"

do_compile(){
}

do_install_append(){
	install -d ${D}${datadir}/apache2/default-site/htdocs
	cp -r ${S}/* ${D}${datadir}/apache2/default-site/htdocs

}


FILES_${PN} += "${datadir}/*"
