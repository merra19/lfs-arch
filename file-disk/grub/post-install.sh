#!/bin/sh

pkg_postinst() {
    if [ ! $(grep -x LFSRAID /etc/fstab) ]; then
    cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options                dump  fsck
#                                                                 order

LABEL=LFSRAID                                 /                         btrfs    defaults            0     1
LABEL=SWAPRAID                                swap                      swap     pri=1               0     0
UUID=5FBE-9A17                                /boot/efi                 vfat     defaults            0     2
LABEL=JeuxRaid                                /mnt/steamhdd             ext4     defaults            0     0
LABEL=STEAMSSD                                /mnt/steamssd             ext4     defaults            0     0
LABEL=OtherRaid                               /mnt/other                ext4     defaults            0     0
#debugfs                                       /sys/kernel/debug         debugfs  defaults            0     0 
# tmpfs /tmp tmpfs rw,nosuid,nodev 0 0

# End /etc/fstab 
EOF

    fi

}

case $1 in
    postinst) pkg_postinst ;;
esac