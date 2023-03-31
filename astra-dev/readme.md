# Content

## Packages
* Dev tools
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
  * git
* General tool
  * mc
* Libraries
  * Boost
    * libboost-dev
    * libboost-system-dev
  * Qt
    * qtdeclarative5-dev
    * libqt5serialport5-dev
  * GStreamer
    * libgstreamer1.0-dev
    * gstreamer1.0-plugins-base
    * gstreamer1.0-plugins-good
    * gstreamer1.0-plugins-bad
    * gstreamer1.0-plugins-ugly
    * gstreamer1.0-libav
    * libgstreamer-plugins-base1.0-dev
    * libgstreamer-plugins-bad1.0-dev
    * gstreamer1.0-tools
  * FFmpeg
    * libavcodec-dev
    * libavcodec57
  * zLib
    * zlib1g
    * zlib1g-dev
  * Other
    * libgomp1

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
* `docker build -t idma88/astra-dev:orel`
* `docker tag idma88/astra-dev:orel idma88/astra-dev:latest`
* `docker push idma88/astra-dev:orel`
* `docker push idma88/astra-dev:latest`