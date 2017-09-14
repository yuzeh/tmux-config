#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

set -e

work_dir=`dirname $0`

[ `pwd` = "$HOME" ] || die "Please run this script from the home directory"

cd $work_dir
git submodule init
git submodule update
cd

cd $work_dir/vendor/basic-cpu-and-memory.tmux
cmake .
make
make install
cd

ln -s "${work_dir}/.tmux.conf" "${HOME}/.tmux.conf"
