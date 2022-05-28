# Core-image-minimal append
# meta-gateway layer 
#ARV 


IMAGE_INSTALL += " \
    python3 \
    python3-pip \
    python3-flask \
    python3-pyserial \
    python3-smbus \
    python3-sqlite3 \
    python3-paho-mqtt \
    python3-requests \
    python3-pydbus \
    apache2 \
    mod-wsgi \
    tzdata \
    gateway-app \
    gateway-device-manager \
    packagegroup-tools-bluetooth \
    python3-pybluez \
    python3-sqlalchemy \
    python3-flask-sqlalchemy \
    wpa-supplicant \
    iw \
    hostapd \
    wireless-regdb \
    nano \
    sudo \
    bluepy \
    git \
    ble-usb \
    libgpiod \
"

IMAGE_ROOTFS_SIZE = "65536"



inherit extrausers

EXTRA_USERS_PARAMS = " \
    usermod -P gateway root; \
" 
   

change_mod() {
	chmod -R 777 ${IMAGE_ROOTFS}/usr/share/apache2/default-site/htdocs/gdm
        chmod -R 777 ${IMAGE_ROOTFS}/usr/sbin/certUploads
	chmod -R 777 ${IMAGE_ROOTFS}/usr/sbin
        ln -nsf /usr/share/zoneinfo/Asia/Kolkata ${IMAGE_ROOTFS}/etc/localtime   
}

ROOTFS_POSTPROCESS_COMMAND += "change_mod; "

