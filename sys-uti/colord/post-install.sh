#!/bin/sh

pkg_preinst() {
    getent group colord || groupadd -g 71 colord
    #getent passwd colord || useradd -c "Color Daemon Owner" -d /var/lib/colord -u 71 -g colord -s /bin/false colord
}


case $1 in
    preinst) pkg_preinst ;;
esac