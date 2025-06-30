#!/bin/sh

pkg_postinst() {
    if [ ! -f /usr/lib/krb5/plugins/kdb/kldap.so ];then
        scratch install -y -f -r krb5
    fi
}

case $1 in
    postinst) pkg_postinst ;;
esac