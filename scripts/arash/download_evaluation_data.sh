#!/bin/bash

# Specify the URL of the data file you want to download
DATA_URL="https://hanoverprod.z21.web.core.windows.net/med_llava/eval/llava_med_eval_qa50_qa.jsonl"

# Specify the destination folder
DEST_FOLDER="./data/eval/"

# Create the destination folder if it doesn't exist
mkdir -p $DEST_FOLDER

# Download the data file to the specified folder
curl -o "$DEST_FOLDER/llava_med_eval_qa50_qa.jsonl" $DATA_URL

# Specify the URL of the data file you want to download
DATA_URL="https://hanoverprod.z21.web.core.windows.net/med_llava/eval/llava_med_eval_qa50_fig_captions.json"

# Download the data file to the specified folder
curl -o "$DEST_FOLDER/llava_med_eval_qa50_fig_captions.json" $DATA_URL

# Specify the URL of the data file you want to download
DATA_URL="https://hanoverprod.z21.web.core.windows.net/med_llava/eval/llava_med_qa50_instruct_caption_in_text_cleaned-60k-3epoch.json"

# Download the data file to the specified folder
curl -o "$DEST_FOLDER/llava_med_qa50_instruct_caption_in_text_cleaned-60k-3epoch.json" $DATA_URL

# Specify the URL of the data file you want to download
DATA_URL="https://hanoverprod.z21.web.core.windows.net/med_llava/llava_med_image_urls.jsonl"

# Download the data file to the specified folder
curl -o "$DEST_FOLDER/llava_med_image_urls.jsonl" $DATA_URL


