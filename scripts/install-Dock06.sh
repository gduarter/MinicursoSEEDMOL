sudo apt update
sudo apt install -y gcc g++ gfortran

cd ~/local
tar -xvf dock06.tar
rm -rf doc06.tar
cd ~/local/dock06/install
./configure gnu
make install dock
