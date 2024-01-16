#!/bin/bash

# Define the URL of the zip file
ZIP_URL="https://hanoverprod.z21.web.core.windows.net/med_llava/models/llava_med_in_text_60k_ckpt2_delta.zip"

# Download the zip file
curl -O $ZIP_URL

# Extract the contents to the parent directory
unzip -q -d ../ $(basename $ZIP_URL)

# Remove the downloaded zip file
rm $(basename $ZIP_URL)

echo "Download and extraction completed."
