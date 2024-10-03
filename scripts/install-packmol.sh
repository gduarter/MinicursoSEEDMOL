#!/usr/bin/bash

set -e

VERSION=$1
sudo apt update
sudo apt install -y gfortran

wget https://github.com/m3g/packmol/archive/refs/tags/v${VERSION}.tar.gz -O /tmp/packmol-v${VERSION}.tar.gz
cd /tmp
tar -xvf packmol-v${VERSION}.tar.gz

mv packmol-${VERSION} ~/local/packmol-${VERSION}
cd ~/local/packmol-${VERSION}
make
