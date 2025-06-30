#!/bin/sh

pkg_postinst() {
    scratch build -f freetype
    scratch -I -y -r freetype
    scratch build -f cairo
    scratch -I -y -r cairo
    scratch build -f graphite2
    scratch -I -y -r graphite2
    scratch build -f harfbuzz
    scratch -I -y -r harfbuzz
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac