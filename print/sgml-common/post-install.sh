#!/bin/sh



pkg_postinst() {
    install-catalog --add /etc/sgml/sgml-ent.cat \
        /usr/share/sgml/sgml-iso-entities-8879.1986/catalog >/dev/null

    install-catalog --add /etc/sgml/sgml-docbook.cat \
        /etc/sgml/sgml-ent.cat >/dev/null

}


pkg_postupgrade() {
    install-catalog --add /etc/sgml/sgml-ent.cat \
        /usr/share/sgml/sgml-iso-entities-8879.1986/catalog >/dev/null

    install-catalog --add /etc/sgml/sgml-docbook.cat \
        /etc/sgml/sgml-ent.cat >/dev/null
}


pkg_postremove() {
    install-catalog --remove /etc/sgml/sgml-ent.cat \
        /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&

    install-catalog --remove /etc/sgml/sgml-docbook.cat \
        /etc/sgml/sgml-ent.cat
}




case $1 in
    postinst) pkg_postinst  ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove  ;;
esac