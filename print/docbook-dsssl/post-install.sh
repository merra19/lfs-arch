#!/bin/sh

pkg_postinst() {
 /usr/bin/install-catalog --add \
        /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/catalog

  /usr/bin/install-catalog --add /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/common/catalog
 
 /usr/bin/install-catalog --add \
        /etc/sgml/sgml-docbook.cat \
        /etc/sgml/dsssl-docbook-stylesheets.cat

}

pkg_postupgrade() {
  post_install $1
}

pkg_postremove() {
  /usr/bin/install-catalog --remove \
        /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/catalog

  /usr/bin/install-catalog --remove /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/common/catalog
  
  /usr/bin/install-catalog --remove \
        /etc/sgml/sgml-docbook.cat \
        /etc/sgml/dsssl-docbook-stylesheets.cat
}


case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac