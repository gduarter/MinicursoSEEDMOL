#!/usr/bin/sh

set -x

sudo apt update
sudo apt install -y git

cd ~/local
git clone https://github.com/ParmEd/ParmEd

cd ParmEd
conda init
conda activate alqpy310
python setup.py install
