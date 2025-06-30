#!/bin/sh

pkg_preinst() {
    getent group fcron || groupadd -g 23 fcron
    getent passwd fcron || useradd -d /dev/null -c "Fcron User" -g fcron -s /bin/false -u 23 fcron
}

pkg_postinst() {
    systemctl enable fcron
    
    fcrontab -z -u systab
}

pkg_preremove() {
    systemctl disable fcron
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac