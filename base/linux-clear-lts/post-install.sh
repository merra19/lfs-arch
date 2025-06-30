#!/bin/sh

name="clear-lts"
export name

pkg_postinst() {
    version="$(awk 'NR==1 {print $1}' /var/lib/scratchpkg/db/linux-$name)"
    release="$(awk 'NR==1 {print $2}' /var/lib/scratchpkg/db/linux-$name)"
    cp /usr/lib/modules/$version-$release-$name-LFS/vmlinuz /boot/vmlinuz-$version-$release-$name-LFS
    
    cd /boot
    #mkinitramfs $kernver
    depmod $version-$release-$name-LFS
    dracut --hostonly --kver $version-$release-$name-LFS

    # run all dkms scripts
    if [ $(command -v dkms) ]; then
        for i in /var/lib/dkms/buildmodules-*.sh; do
            sh $i
        done
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_preremove() {
    version="$(awk 'NR==1 {print $1}' /var/lib/scratchpkg/db/linux-$name)"
    release="$(awk 'NR==1 {print $2}' /var/lib/scratchpkg/db/linux-$name)"
    (
        cd /usr/lib/modules/$version-$release-$name-LFS/
        for i in * ;do
            case $i in
                modules.order|modules.builtin|modules.builtin.modinfo) ;;
                modules.*) rm -f $i ;;
                *) ;;
            esac
        done
    )
    rm -fv /boot/initramfs-$version-$release-$name-LFS.img
    rm -fv /boot/vmlinuz-$version-$release-$name-LFS
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    preremove) pkg_preremove ;;
esac