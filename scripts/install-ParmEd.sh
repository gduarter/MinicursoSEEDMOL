#!/usr/bin/sh

set -x

sudo apt update
sudo apt install -y git

cd ~/local
git clone https://github.com/ParmEd/ParmEd

cd ParmEd
python setup.py install
