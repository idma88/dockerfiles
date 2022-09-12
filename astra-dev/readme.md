# Packages

## Old
* gcc
* gdb
* cmake
* clang
* clang-format
* clang-tools
* lldb
* qtdeclarative5-dev
* zlib1g
* zlib1g-dev

## New
* gcc
* g++
* gdb
* make
* cmake
* clang
* clang-format
* clang-tidy
* clang-tools
* lldb
* qtdeclarative5-dev
* zlib1g=1:1.2.11.dfsg-1
* zlib1g-dev

# View all packages with depends
```
apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances <packages> | grep "^\w" | sort -u
```

# Download all packages with depends
```
apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances <packages> | grep "^\w" | sort -u)
dpkg-scanpackages . | gzip -9c > Packages.gz
```