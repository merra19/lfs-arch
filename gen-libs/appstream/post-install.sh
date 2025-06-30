#!/bin/sh

pkg_postinst() {
    /usr/bin/appstreamcli refresh-cache --force
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postupgrade) pkg_postupgrade ;;
    postinst) pkg_postinst ;;
esac