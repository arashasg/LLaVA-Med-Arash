#!/bin/bash

# Activate conda from source
MINICONDA_DIR="$HOME/miniconda3"
source $MINICONDA_DIR/bin/activate

# Activate Conda environment
conda activate llama-med

# Uninstall current version of transformers
pip uninstall transformers -y

# Install the specific release
pip install git+https://github.com/huggingface/transformers.git@v4.34.1


# Execute Python code
python3 -m llava.model.apply_delta \
    --base ../LLaMA-HF \
    --target ../LLaVA-Med-Model \
    --delta ../llava_med_in_text_60k_ckpt2_delta

# Deactivate Conda environment
conda deactivate

echo "LLaVA-Med delta applied succesfully!"