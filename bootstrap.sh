#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

set -e

current_dir=`dirname $0`

[ `pwd` = "$HOME" ] || die "Please run this script from the home directory"

git submodule init
git submodule update

pushd $current_dir/vendor/basic-cpu-and-memory.tmux
cmake .
make
make install
popd

ln -s "${current_dir}/.tmux.conf" "${HOME}/.tmux.conf"
