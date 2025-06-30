#!/bin/sh


pkg_postinst() {
    dot -c
}

pkg_postupgrade() {
    dot -c
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac