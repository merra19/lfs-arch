#!/bin/sh

pkg_postinst() {
    scratch -I -y -f -r libva-32
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac