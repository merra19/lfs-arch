#!/bin/sh

pkg_postinst() {
    /usr/bin/update-ca-certificates

    #systemctl enable update-pki.timer
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac