#!/bin/sh

pkg_postinst() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
    /bin/sh -c 'killall -q -s USR1 gvfsd || true'
}

pkg_postupgrade() {
    /bin/sh -c 'killall -q -s USR1 gvfsd || true'
}

pkg_postremove() {
    /bin/sh -c 'killall -q -s USR1 gvfsd || true'
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac