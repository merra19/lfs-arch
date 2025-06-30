#!/bin/sh

pkg_postinst() {
    /usr/bin/install-catalog --add \
        /etc/sgml/openjade-1.3.2.cat \
        /usr/share/sgml/openjade-1.3.2/catalog > /dev/null 2>&1

    /usr/bin/install-catalog --add \
        /etc/sgml/openjade.cat \
        /etc/sgml/openjade-1.3.2.cat > /dev/null 2>&1

}

pkg_postupgrade() {
  post_install $1
}

pkg_postremove() {
  /usr/bin/install-catalog --remove \
        /etc/sgml/openjade-1.3.2.cat \
        /usr/share/sgml/openjade-1.3.2/catalog > /dev/null 2>&1
  
  /usr/bin/install-catalog --remove \
        /etc/sgml/openjade.cat \
        /etc/sgml/openjade-1.3.2.cat > /dev/null 2>&1
}

case $1 in
    postinst) pkg_postinst  ;;
    postupgrade) pkg_postupgrade $2 ;;
    postremove) pkg_postremove ;;
esac

if ! grep -q 'SYSTEM "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"' /usr/share/sgml/openjade-1.3.2/catalog; then
    echo "SYSTEM \"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\" \
    \"/usr/share/xml/docbook/xml-dtd-4.5/docbookx.dtd\"" >> \
    /usr/share/sgml/openjade-1.3.2/catalog
fi