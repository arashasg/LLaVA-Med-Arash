#!/bin/bash

# Activate the "infra" Conda environment
MINICONDA_DIR="$HOME/miniconda3"
PY_SCRIPT_PATH="scripts/arash/llama_downloader.py"
source $MINICONDA_DIR/bin/activate
conda activate infra

# Update pip, setuptools, and wheel
sudo python -m pip install --upgrade pip setuptools wheel

# Install lbry-libtorrent, wget, torf
python -m pip install lbry-libtorrent wget torf

# Install python3-libtorrent
sudo apt-get install -y python3-libtorrent

echo "Libtorrent installation completed."

# Call llama_downloader.py
python $PY_SCRIPT_PATH

echo "llama_downloader.py executed."

# Deactivate the Conda environment
conda deactivate
conda deactivate

echo "Conda environment deactivated."
