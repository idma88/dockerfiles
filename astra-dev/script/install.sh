#!/bin/bash
clear

files=files.txt
urlTemplate="https://github.com/idma88/dockerfiles/blob/astra-se1.7/astra-dev/deb/%s?raw=true"

# Install wget & git
apt update -y
apt install -y --no-install-recommends ca-certificates wget git

# Download DEB packets
tr -d '\r' < $files | while read filename; do
  fileName=$(printf $urlTemplate "$filename")
  wget -nv -nc --no-check-certificate $fileName -O $filename
done

# Backup sources.list
mv -f /etc/apt/sources.list /etc/apt/sources.list.bak

# Add local repo
echo "deb [trusted=yes] file://$PWD/ ./" >> /etc/apt/sources.list

# Update & upgrade
apt update -y
apt upgrade -y

# Install dev tools & libs
apt install -y --no-install-recommends --allow-downgrades \
    libc6=2.28-10+ci202012301235+astra1 \
    gcc \
    g++ \
    gdb \
    make \
    cmake \
    clang \
    clang-format \
    clang-tidy \
    clang-tools \
    lldb \
    qtdeclarative5-dev \
    zlib1g=1:1.2.11.dfsg-1 \
    zlib1g-dev







# Cleanup
apt remove -y ca-certificates wget
apt autoremove -y
apt autoclean -y
tr -d '\r' < $files | while read filename || [[ -n "$filename" ]]; do
  fileName=$(printf $urlTemplate "$filename")
  rm -f $filename
done

# Restore sources.list
mv -f /etc/apt/sources.list.bak /etc/apt/sources.list