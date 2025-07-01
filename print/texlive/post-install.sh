#!/bin/sh

pkg_postinst() {
    source /etc/profile.d/texlive.sh
    mktexlsr &&
    fmtutil-sys --all
}

case $1 in
    postinst) pkg_postinst $2 ;;
esac