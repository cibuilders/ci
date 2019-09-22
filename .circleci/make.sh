#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get install -y axel
cd /tmp || exit 1
axel -a -n 10 https://ftp.gnu.org/gnu/make/make-4.2.tar.gz
tar xvzf /tmp/make-4.2.tar.gz
cd /tmp/make-4.2 || exit 1
./configure
curl https://raw.githubusercontent.com/akhilnarang/scripts/master/patches/make-glibc_alloc_fix.patch | patch -p1
bash ./build.sh
sudo install ./make /usr/local/bin/make
cd - || exit 1
rm -rf /tmp/make-4.2*
