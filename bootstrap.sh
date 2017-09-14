#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

current_dir=`dirname $0`

[ `pwd` = "$HOME" ] || die "Please run this script from the home directory"

ln -s "${current_dir}/.tmux.conf" ${HOME}/.tmux.conf"
