#!/bin/sh

pkg_postinst() {
    /usr/lib/vlc/vlc-cache-gen /usr/lib/vlc/plugins
}

pkg_postupgrade() {
    /usr/lib/vlc/vlc-cache-gen /usr/lib/vlc/plugins
}

pkg_postremove() {
    /usr/lib/vlc/vlc-cache-gen /usr/lib/vlc/plugins
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac