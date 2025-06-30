#!/bin/sh


pkg_postinst() {
    mktexlsr &&
    fmtutil-sys --all
}

case $1 in
    postinst) pkg_postinst $2 ;;
esac