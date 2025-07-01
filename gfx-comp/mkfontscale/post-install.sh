#!/bin/sh

pkg_postinst() {
    pkg_postupgrade
}

pkg_postupgrade() {
    if [[ -d /usr/share/fonts ]]; then
        echo -n "Creating X fontdir indices..."
        find /usr/share/fonts -mindepth 1 -path /usr/share/fonts/encodings -prune \
        -o -type d -printf '%p/\n' | /usr/share/libalpm/scripts/xorg-mkfontscale
        echo " done."
  fi
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac