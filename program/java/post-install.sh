#!/bin/sh

pkg_postinst() {
if ! grep -q "Java" /etc/man_db.conf; then

cat >> /etc/man_db.conf << "EOF"
# Begin Java addition
MANDATORY_MANPATH     /opt/jdk/man
MANPATH_MAP           /opt/jdk/bin     /opt/jdk/man
MANDB_MAP             /opt/jdk/man     /var/cache/man/jdk
# End Java addition
EOF

mandb -c /opt/jdk/man
fi
}

pkg_postremove() {
    sed -i '/# Begin Java/,/# End Java/d' /etc/man_db.con
    mandb -c
}



case $1 in
    postinst) pkg_postinst ;;
    postremove) pkg_postremove ;;
esac