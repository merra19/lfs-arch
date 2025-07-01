#!/bin/sh

pkg_postinst() {
    if [ ! -d /srv/mariadb ]; then
        mariadb-install-db --basedir=/usr --datadir=/srv/mariadb --user=mariadb
        chown -R mariadb:mariadb /srv/mariadb
    fi
}


case $1 in
    preinst) pkg_preinst ;;
esac