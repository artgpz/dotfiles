#!/bin/bash

VERSION=1.1.5
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=amd64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing lsd"
  curl -LOsS https://github.com/lsd-rs/lsd/releases/download/v$VERSION/lsd_$VERSION_$arch.deb
  dpkg -i lsd_$VERSION_$arch.deb >/dev/null 2>&1
  echo -e "${GREEN} lsd installed ${CLEAR}"
fi
