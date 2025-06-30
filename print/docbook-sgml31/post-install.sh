#!/bin/sh

# arg 1:  the new package version
pkg_postinst() {
	add_catalog "${1}"
}

# arg 1:  the new package version
# arg 2:  the old package version
pkg_preupgrade() {
	remove_catalog "${2}"
}

# arg 1:  the new package version
# arg 2:  the old package version
pkg_postupgrade() {
	add_catalog "${1}"
}

# arg 1:  the old package version
pkg_preremove() {
	remove_catalog "${1}"
}

add_catalog() {
    echo "add catalog /usr/share/sgml/docbook-sgml-$1/catalog"
	install-catalog --add /etc/sgml/sgml-docbook-dtd-$1.cat \
		/usr/share/sgml/docbook-sgml-$1/catalog > /dev/null 2>&1

	install-catalog --add /etc/sgml/sgml-docbook-dtd-$1.cat \
		/etc/sgml/sgml-docbook.cat > /dev/null 2>&1
}

remove_catalog() {
	install-catalog --remove /etc/sgml/sgml-docbook-dtd-$1.cat \
		/usr/share/sgml/docbook-sgml-$1/catalog > /dev/null 2>&1

	install-catalog --remove /etc/sgml/sgml-docbook-dtd-$1.cat \
		/etc/sgml/sgml-docbook.cat > /dev/null 2>&1
}

case $1 in
    postinst) pkg_postinst $2 ;;
    postupgrade) pkg_postupgrade $2 $3 ;;
    preupgrade) pkg_preupgrade $2 $3 ;;
    preremove) pkg_preremove $2 ;;
esac