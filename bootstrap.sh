#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

set -e

current_dir=`dirname $0`

pushd $current_dir/vendor/basic-cpu-and-memory.tmux
cmake .
make
make install
popd

[ `pwd` = "$HOME" ] || die "Please run this script from the home directory"

ln -s "${current_dir}/.tmux.conf" "${HOME}/.tmux.conf"
