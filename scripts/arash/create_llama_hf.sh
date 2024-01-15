#!/bin/bash

# Activate conda from source
MINICONDA_DIR="$HOME/miniconda3"
source $MINICONDA_DIR/bin/activate

# Activate Conda environment
conda activate llama-med

# Define the GitHub repository URL
REPO_URL="https://github.com/huggingface/transformers.git"

# Define the paths
INPUT_DIR="./../../LLaMA/"
OUTPUT_DIR="./../../LLaMA-HF/"

# Clone the GitHub repository
git clone $REPO_URL

pip install git+https://github.com/huggingface/transformers

cd transformers

# Run the conversion script
python src/transformers/models/llama/convert_llama_weights_to_hf.py --input_dir $INPUT_DIR --model_size 7B --output_dir $OUTPUT_DIR

# Return to the original directory
cd ..

# Remove the cloned repository
rm -rf transformers

# Deactivate Conda environment
conda deactivate




echo "Conversion completed and Python file deleted."
