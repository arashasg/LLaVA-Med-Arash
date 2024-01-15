#!/bin/bash

# Activate conda from source
MINICONDA_DIR="$HOME/miniconda3"
source $MINICONDA_DIR/bin/activate

# Create Conda environment
conda create -n llama-med python=3.10 -y

# Activate Conda environment
conda activate llama-med

# Upgrade pip
pip install --upgrade pip

# Uninstall torch and torchvision
pip uninstall torch torchvision -y

# Install specific version of torch, torchvision, and torchaudio
pip install torch==2.0.0+cu117 torchvision==0.15.1+cu117 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu117

# Install openai
pip install openai==0.27.8

# Uninstall transformers
pip uninstall transformers -y

# Install transformers from a specific commit on GitHub
pip install git+https://github.com/huggingface/transformers@cae78c46

# Install other dependencies
pip install -e .
pip install einops ninja open-clip-torch

# Install flash-attn without build isolation
pip install flash-attn --no-build-isolation

# Deactivate Conda environment
conda deactivate

echo "Environment creation and package installation completed."
