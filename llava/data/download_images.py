import os
import json
import shutil
import tarfile
import argparse
from urllib.error import HTTPError
import urllib.request
from multiprocessing import Pool
import multiprocessing as mp
from tqdm import tqdm

parser = argparse.ArgumentParser()
parser.add_argument('--input_path', type=str, default='data/llava_med_image_urls.jsonl')
parser.add_argument('--pmc_output_path', type=str, default='data/pmc_articles/')
parser.add_argument('--images_output_path', type=str, default='data/images/')
parser.add_argument('--remove_pmc', action='store_true', default=False, help='remove pmc articles after image extraction')
parser.add_argument('--cpus', type=int, default=-1, help='number of cpus to use in multiprocessing (default: all)')
args = parser.parse_args()

input_data = []
with open(args.input_path) as f:
    for line in f:
        input_data.append(json.loads(line))

def download_func(sample):
    try:
        pmc_tar_url = sample['pmc_tar_url']
        pmc_tar_filename = os.path.basename(pmc_tar_url)
        pmc_tar_path = os.path.join(args.pmc_output_path, pmc_tar_filename)

        if not os.path.exists(os.path.join(args.images_output_path, sample['pair_id']+'.jpg')):
            # Download PMC tar file
            urllib.request.urlretrieve(pmc_tar_url, pmc_tar_path)

            # Extract PMC tar file
            with tarfile.open(pmc_tar_path, "r:gz") as tar:
                tar.extractall(args.pmc_output_path)

            # Copy image file to output path
            src = os.path.join(args.pmc_output_path, sample['image_file_path'])
            dst = os.path.join(args.images_output_path, sample['pair_id']+'.jpg')
            shutil.copyfile(src, dst)

            if args.remove_pmc:
                os.remove(pmc_tar_path)
                shutil.rmtree(os.path.join(args.pmc_output_path, pmc_tar_filename).split('.tar.gz')[0]+'/')
        else:
            print(f"Skipping existing file: {sample['pair_id']+'.jpg'}")
    except Exception as e:
        print(e)

if args.cpus == -1:
    cpus = mp.cpu_count()
else:
    cpus = args.cpus

# Filter out samples with existing image paths
# non_existing_samples = [sample for sample in input_data if not os.path.exists(os.path.join(args.images_output_path, sample['pair_id']+'.jpg'))]
required = open("/home/cc/torrent_downloader/LLaVA-Med-Arash/llava/data/address.txt", "r")
required = [os.path.splitext(os.path.split(addr)[1])[0] for addr in required.readlines()]
required_files = [sample for sample in input_data if sample['pair_id'] in required]
print([sample['pair_id'] for sample in input_data[:100]])
print(len(required_files))
print(len(required))
print(len(input_data))
# with Pool(cpus) as pool:
#     list(tqdm(pool.imap(download_func, non_existing_samples), total=len(non_existing_samples), desc="Downloading and Extracting"))
print("F0003" in [sample["pair_id"]for sample in input_data])