#Append script for tdx-reference minimal
#ARV
#Toradex
#Layer meta-gateway

IMAGE_INSTALL += " \
    python3 \
    nano \
    bluez5-noinst-tools \
    ti-18xx-wlconf \
    wl18xx-fw \
    bluepy \
    python3-flask \
    python3-sqlite3 \
    python3-paho-mqtt \
    python3-requests \
    python3-dbus \
    apache2 \
    mod-wsgi \
    ble-usb \
    gateway-app \
    gateway-device-manager \
    gateway-job \
    jq \
    ble-uart \
    dnsmasq \
    gateway-wifi \
    gateway-watch-config \
    gateway-watch-wifi \
    gateway-io \
"

change_mod() {
	chmod -R 777 ${IMAGE_ROOTFS}/usr/share/apache2/default-site/htdocs/gdm
        chmod -R 777 ${IMAGE_ROOTFS}/etc/gateway
        chmod -R 777 ${IMAGE_ROOTFS}/usr/sbin/app
        ln -nsf /usr/share/zoneinfo/Asia/Kolkata ${IMAGE_ROOTFS}/etc/localtime   
}

ROOTFS_POSTPROCESS_COMMAND += "change_mod; "
