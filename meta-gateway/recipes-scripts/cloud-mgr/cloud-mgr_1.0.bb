DESCRIPTION = "Python based cloud manager to push data to cloud over unsecured MQTT/SOCKET/HTTP proctocol"
SECTION = "cloud-mgr"

LICENSE = "CLOSED"


SRC_URI = "file://Client_man.py \
	   file://Client_man.service"




inherit allarch systemd

S = "${WORKDIR}"

do_compile(){
}

do_install_append(){
	install -d ${D}${sbindir}
	install -m 777 ${S}/Client_man.py ${D}/${sbindir}
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/Client_man.service ${D}${systemd_unitdir}/system


}

SYSTEMD_SERVICE_${PN} = "Client_man.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"


