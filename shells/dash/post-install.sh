#!/bin/sh

pkg_postinst() {
    if ! grep -q "dash" /etc/shells; then
        echo '/bin/dash' >> /etc/shells
    fi
}

pkg_postremove() {
    sed -i '/dash/d' /etc/shells
}

case $1 in
    postinst) pkg_postinst ;;
    postremove) pkg_postremove ;;
esac