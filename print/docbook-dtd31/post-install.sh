#!/bin/sh

pkg_postinst() {
    install-catalog --add /etc/sgml/sgml-docbook-dtd-3.1.cat \
        /usr/share/sgml/docbook/sgml-dtd-3.1/catalog &&

    install-catalog --add /etc/sgml/sgml-docbook-dtd-3.1.cat \
        /etc/sgml/sgml-docbook.cat


xmlcatalog --noout --add "delegatePublic" "-//OASIS//ENTITIES DocBook"         "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegatePublic" "-//OASIS//ELEMENTS DocBook"         "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegatePublic" "-//OASIS//DTD DocBook"              "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegateSystem" "http://www.oasis-open.org/docbook/" "file:///etc/xml/docbook" /etc/xml/catalog
xmlcatalog --noout --add "delegateURI"    "http://www.oasis-open.org/docbook/" "file:///etc/xml/docbook" /etc/xml/catalog
}


other() {
    if ! grep -q "Davenport" /usr/share/sgml/docbook/sgml-dtd-3.1/catalog; then
cat >> /usr/share/sgml/docbook/sgml-dtd-3.1/catalog << "EOF"
  -- Begin Single Major Version catalog changes --

PUBLIC "-//Davenport//DTD DocBook V3.0//EN" "docbook.dtd"

  -- End Single Major Version catalog changes --
EOF
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac





