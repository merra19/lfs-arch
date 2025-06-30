#!/bin/sh

pkg_postinst() {
    install-catalog --add /etc/sgml/sgml-docbook-dtd-4.5.cat \
        /usr/share/sgml/docbook/sgml-dtd-4.5/catalog &&

    install-catalog --add /etc/sgml/sgml-docbook-dtd-4.5.cat \
        /etc/sgml/sgml-docbook.cat


xmlcatalog --noout --add "delegatePublic" "-//OASIS//ENTITIES DocBook"         "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegatePublic" "-//OASIS//ELEMENTS DocBook"         "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegatePublic" "-//OASIS//DTD DocBook"              "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegateSystem" "http://www.oasis-open.org/docbook/" "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegateURI"    "http://www.oasis-open.org/docbook/" "file:///etc/xml/docbook" /etc/xml/catalog
}

other() {
    if ! grep -q "DTD DocBook V4.4" /usr/share/sgml/docbook/sgml-dtd-4.5/catalog; then
cat >> /usr/share/sgml/docbook/sgml-dtd-4.5/catalog << "EOF"
  -- Begin Single Major Version catalog changes --

PUBLIC "-//OASIS//DTD DocBook V4.4//EN" "docbook.dtd"
PUBLIC "-//OASIS//DTD DocBook V4.3//EN" "docbook.dtd"
PUBLIC "-//OASIS//DTD DocBook V4.2//EN" "docbook.dtd"
PUBLIC "-//OASIS//DTD DocBook V4.1//EN" "docbook.dtd"
PUBLIC "-//OASIS//DTD DocBook V4.0//EN" "docbook.dtd"

  -- End Single Major Version catalog changes --
EOF
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_preremove() {
    install-catalog --remove /etc/sgml/sgml-docbook-dtd-4.5.cat \
        /usr/share/sgml/docbook/sgml-dtd-4.5/catalog &&

    install-catalog --remove /etc/sgml/sgml-docbook-dtd-4.5.cat \
        /etc/sgml/sgml-docbook.cat
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    preremove) pkg_preremove ;;
esac