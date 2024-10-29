sudo apt update
sudo apt install -y gcc g++ gfortran

mv scripts/dock6.tar.gz ~/local
cd ~/local
tar -xvzf dock6.tar.gz
#rm -rf dock6.tar.gz
cd ~/local/dock6.10/install
./configure gnu
make dock
