#!/usr/bin/bash

set -e

# instalação dos pacotes necessários
sudo apt update
sudo apt install -y gcc g++ gfortran

wget https://github.com/... -O /tmp/dock06.tar.gz
cd /tmp
tar -xvf dock06.tar.gz
rm -rf doc06.tar.gz

mv dock06 ~/local/dock06
cd ~/local/dock06/install
./configure gnu
make install dock


