#!/bin/sh

_xmlcatalog() {
	xmlcatalog --noout "$@" /etc/xml/catalog
}

version=1.79.2

pkg_postinst() {

[ -f /etc/xml/catalog ] || _xmlcatalog --create

for ver in $version current; do
	for x in rewriteSystem rewriteURI; do
		_xmlcatalog --add $x http://cdn.docbook.org/release/xsl/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-$version

		_xmlcatalog --add $x http://docbook.sourceforge.net/release/xsl-ns/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-$version

		_xmlcatalog --add $x http://docbook.sourceforge.net/release/xsl/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-nons-$version
	done
done
}

pkg_postupgrade() {
    pkg_postinst $1 $2
}

pkg_preremove() {

for ver in $version current; do
	for x in rewriteSystem rewriteURI; do
		_xmlcatalog --del $x http://cdn.docbook.org/release/xsl/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-$version

		_xmlcatalog --del $x http://docbook.sourceforge.net/release/xsl-ns/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-$version

		_xmlcatalog --del $x http://docbook.sourceforge.net/release/xsl/$ver \
		/usr/share/xml/docbook/xsl-stylesheets-nons-$version
	done
done
}

case $1 in
    postinst) pkg_postinst $2 ;;
    postupgrade) pkg_postupgrade $2 $3 ;;
    preremove) pkg_preremove $2 ;;
esac