#!/bin/sh

pkg_postinst() {

    if [ ! -f /var/lib/scratchpkg/toolchain ];then

        mv -v /tools/bin/{ld,ld-old}
        mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
        mv -v /tools/bin/{ld-new,ld}
        ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld

        gcc -dumpspecs | sed -e 's@/tools@@g'   \
            -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
            -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
            `dirname $(gcc --print-libgcc-file-name)`/specs

        touch /var/lib/scratchpkg/toolchain

        echo -e '/usr/lib\n/tools/lib\n/tools/lib32' > /etc/ld.so.conf.d/tools.conf
    fi

    if [ ! -f /etc/localtime ] ;then
        ln -sfv /usr/share/zoneinfo/Europe/Paris /etc/localtime
    fi 

    pkg_postupgrade
}

pkg_postupgrade() {
    locale-gen
    ldconfig
    iconvconfig
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac