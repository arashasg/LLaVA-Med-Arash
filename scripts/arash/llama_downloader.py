import libtorrent as lt

# Torrent file or magnet link
torrent_file = "./scripts/arash/llama_downloader.torrent"
# Destination directory for downloaded files
download_path = "./../"

# Create a session
ses = lt.session()

# Add the torrent to the session
info = lt.torrent_info(torrent_file)
h = ses.add_torrent({"ti": info, "save_path": download_path})

# Iterate through the files in the torrent
for i in range(info.num_files()):
    file_entry = info.file_at(i)
    
    # Example: Download only files in a specific folder
    if "7B" in file_entry.path or "tokenizer" in file_entry.path:
        h.file_priority(i, 1)  # Set the priority to 1 for the selected folder
    else:
        h.file_priority(i, 0)  # Set the priority to 0 for other files/folders

# Download loop
print("Downloading... Press Ctrl+C to stop.")
while not h.is_seed():
    s = h.status()
    print("Progress: {:.2%} - Download Speed: {} - Upload Speed: {}".format(
        s.progress, s.download_rate, s.upload_rate))