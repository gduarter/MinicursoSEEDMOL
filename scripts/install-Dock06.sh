sudo apt update
sudo apt install -y gcc g++ gfortran

cd ~/local
tar -xvzf dock06.tar.gz
rm -rf doc06.tar.gz
cd ~/local/dock06/install
./configure gnu
make install dock
