#!/bin/sh

pkg_postinst() {
    pwconv
    grpconv
}

case $1 in
    postinst) pkg_postinst ;;
esac