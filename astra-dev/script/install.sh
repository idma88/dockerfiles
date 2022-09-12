#!/bin/bash

# Install some tools & git
apt update -y
apt install -y --no-install-recommends ca-certificates wget parallel git

# Download DEB packets
tr -d '\r' < files.txt | \
sed 's/.*/https:\/\/github.com\/idma88\/dockerfiles\/blob\/astra-se1.7\/astra-dev\/deb\/\0?raw=true \0/' | \
parallel --colsep ' ' wget -nv -nc --no-check-certificate {1} -O {2}

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
apt remove -y ca-certificates wget parallel
apt autoremove -y
apt autoclean -y
tr -d '\r' < files.txt | parallel rm -f {}

# Restore sources.list
mv -f /etc/apt/sources.list.bak /etc/apt/sources.list