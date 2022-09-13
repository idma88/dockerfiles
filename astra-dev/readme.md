# Content

## Packages
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
* libomp-dev

## Additionally
* Google Test v1.12.0

# How to get DEBs

## `[optional]` View all packages with depends
```
apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances <packages> | grep "^\w" | sort -u
```

## Download all packages with depends
```
apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances <packages> | grep "^\w" | sort -u)
dpkg-scanpackages . | gzip -9c > Packages.gz
```

# Build & push to Docker Hub
* `docker build -t idma88/astra-dev:se1.7-slim`
* `docker tag idma88/astra-dev:se1.7-slim idma88/astra-dev:latest`
* `docker push idma88/astra-dev:se1.7-slim`
* `docker push idma88/astra-dev:latest`