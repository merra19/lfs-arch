#!/bin/sh

pkg_postinst() {
    update-mime-database /usr/share/mime
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_postremove() {
    if [ -d usr/share/mime ]; then
        rm -f usr/share/mime/{globs,globs2,icons,treemagic,generic-icons,types,magic,XMLnamespaces,subclasses,aliases,mime.cache}
        rm -rf usr/share/mime/{application,audio,image,inode,message,model,multipart,text,video,x-content,x-epoc}
        rmdir --ignore-fail-on-non-empty usr/share/mime
    fi
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac