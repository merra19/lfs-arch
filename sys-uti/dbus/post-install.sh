#!/bin/sh

pkg_postinst() {
    dbus-uuidgen --ensure
}

case $1 in
    postinst) pkg_postinst ;;
esac