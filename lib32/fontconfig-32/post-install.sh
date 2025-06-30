#!/bin/sh

pkg_postinst() {
    pkg_postupgrade
}

pkg_postupgrade() {
    /usr/bin/fc-cache-32 -rs
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac