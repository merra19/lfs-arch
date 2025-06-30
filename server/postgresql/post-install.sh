#!/bin/sh

pkg_postupgrade() {
    if [ -d /var/lib/postgres/data ]; then
        /usr/bin/postgresql-check-db-dir /var/lib/postgres/data || true
    fi
}


case $1 in
    postupgrade) pkg_postupgrade ;;
esac