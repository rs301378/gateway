SUMMARY = "Gateway Application"
DESCRIPTION = "Application handling cloud, node and database thread to communicate IOT Device to cloud server"
HOMEPAGE = "https://github.com/ScratchnestMPU/Gateway-app.git"
LICENSE = "CLOSED"

SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/ScratchnestMPU/Gateway-app.git;protocol=git;branch=master"

inherit allarch systemd setuptools3

S = "${WORKDIR}/git"

do_compile(){
}

do_install_append(){
        
	install -d ${D}${sbindir}
        install -d ${D}${sbindir}/certUploads
	cp ${S}/gatewayMain.sh ${D}/${sbindir}
        install -m 777 ${S}/mydatabasenew.db ${D}/${sbindir}
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${S}/app.service ${D}${systemd_unitdir}/system


}

SYSTEMD_SERVICE_${PN} = "app.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"


