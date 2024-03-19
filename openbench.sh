#!/bin/bash -i

# Set args
THREADS="$1"
SERVER="$2"
USERNAME="$3"
PASSWORD="$4"
REPO="$5"

# Print args
echo Threads used : $THREADS
echo Target server: \"$SERVER\"
echo Target repo  : \"$REPO\"

# Update and install dependencies
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install build-essential clang golang-go make cmake gcc g++ -y

# Install rust via rustup
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo "export PATH=\"\$HOME/.cargo/bin:\$PATH\""  >> ~/.bashrc
source ~/.bashrc

# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs -y

# Clone client and install dependencies
git clone "$REPO"
cd OpenBench/Client
pip3 install -r requirements.txt

# Run worker
python3 client.py -U "$USERNAME" -P "$PASSWORD" -S "$SERVER" --clean -N 1 -T "$THREADS"
