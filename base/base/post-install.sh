#!/bin/sh

pkg_postinst() {
    scratch install -f -r pam dbus

    scratch build -f udev 
    scratch install -r udev

    udev-hwdb update

    rm -f /etc/ld.so.conf.d/tools.conf

    /usr/bin/update-ca-certificates

    # /usr/lib/artix/sv-cg.sh up elogind


cat > /usr/bin/sc << "EOF"
if [ ! -d /sources/ports/base ];then
    echo "mounting ports src"
    sudo pkgmount -m
fi

exec sudo scratch "$@"
EOF
chmod +x /usr/bin/sc 

}

case $1 in
    postinst) pkg_postinst ;;
esac