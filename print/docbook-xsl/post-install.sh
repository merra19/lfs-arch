#!/bin/sh


pkg_postinst() {
if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
fi &&

    xmlcatalog --noout --add "rewriteSystem" \
            "http://cdn.docbook.org/release/xsl/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "https://cdn.docbook.org/release/xsl/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://cdn.docbook.org/release/xsl/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "https://cdn.docbook.org/release/xsl/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "http://cdn.docbook.org/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "https://cdn.docbook.org/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://cdn.docbook.org/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "https://cdn.docbook.org/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "http://docbook.sourceforge.net/release/xsl-ns/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://docbook.sourceforge.net/release/xsl-ns/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-1.79.2" \
        /etc/xml/catalog

### NONS
    xmlcatalog --noout --add "rewriteSystem" \
            "http://cdn.docbook.org/release/xsl-nons/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "https://cdn.docbook.org/release/xsl-nons/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://cdn.docbook.org/release/xsl-nons/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "https://cdn.docbook.org/release/xsl-nons/1.79.2" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "http://cdn.docbook.org/release/xsl-nons/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "https://cdn.docbook.org/release/xsl-nons/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://cdn.docbook.org/release/xsl-nons/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "https://cdn.docbook.org/release/xsl-nons/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteSystem" \
            "http://docbook.sourceforge.net/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog &&

    xmlcatalog --noout --add "rewriteURI" \
            "http://docbook.sourceforge.net/release/xsl/current" \
            "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
        /etc/xml/catalog
}

pkg_postupgrade() {
  pkg_postinst $1 $2
}

pkg_preremove() {
    xmlcatalog --noout --del /usr/share/xml/docbook/xsl-stylesheets-1.79.2 /etc/xml/catalog
    xmlcatalog --noout --del /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 /etc/xml/catalog
}

case $1 in
    postinst) pkg_postinst $2 ;;
    postupgrade) pkg_postupgrade $2 $3 ;;
    preremove) pkg_preremove $2 ;;
esac