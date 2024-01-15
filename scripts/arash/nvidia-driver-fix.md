# Fix Nvidia Driver Broken Installation

Run the following command with the name file that is broken in your installation:
sudo dpkg -i --for
```
sudo dpkg -i --force-overwrite /var/cache/apt/archives/nvidia-kernel-common-535_535.129.03-0ubuntu1_amd64.deb
```
Remove the current Installation:
```
sudo apt-get remove --purge '^nvidia-.*'
```
Update and upgrade your packages:

```
sudo apt update
sudo apt upgrade
```
Install the new Driver:
```
sudo apt install nvidia-525
```
