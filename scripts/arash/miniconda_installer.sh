#!/bin/bash

# Define Miniconda version and Python version (adjust as needed)
MINICONDA_VERSION="latest"
PYTHON_VERSION="3"
INFRA_PYTHON_VERSION="3.10"

# Define the download URL based on the provided version and Python version
MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda${PYTHON_VERSION}-${MINICONDA_VERSION}-Linux-x86_64.sh"

# Define the installation directory
INSTALL_DIR="$HOME/miniconda3"

# Download Miniconda installer
curl -O $MINICONDA_URL

# Run the installer
bash Miniconda${PYTHON_VERSION}-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p $INSTALL_DIR

# Add Miniconda to PATH
export PATH="$INSTALL_DIR/bin:$PATH"

# Remove the downloaded installer
rm Miniconda${PYTHON_VERSION}-${MINICONDA_VERSION}-Linux-x86_64.sh

# Display Miniconda version
conda --version

# Display Python version
python --version

# Display Conda info
conda info

echo "Miniconda installed successfully."

# Activate the conda base environment
source $INSTALL_DIR/bin/activate

# Create a new environment with Python 3.10

conda create -n infra python=${INFRA_PYTHON_VERSION}

echo "infra environment created!"

