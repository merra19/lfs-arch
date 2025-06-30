#!/bin/sh

update_etc_shells() {
  # make git-shell a valid shell
  if ! grep -qe '^/usr/bin/git-shell$' /etc/shells; then
    echo '/usr/bin/git-shell' >> /etc/shells
  fi
}

pkg_postinst() {
    update_etc_shells
}

pkg_preremove() {
    sed -i -r '/^\/usr\/bin\/git-shell$/d' etc/shells
}

pkg_postupgrade() {
    update_etc_shells
}

case $1 in
    postinst) pkg_postinst ;;
    postremove) pkg_preremove ;;
    postupgrade) pkg_postupgrade ;;
esac