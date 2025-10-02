#!/bin/bash

VERSION=0.11.1
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=amd64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing bottom"
  curl -LOsS https://github.com/ClementTsang/bottom/releases/download/$VERSION/bottom_$VERSION-1_$arch.deb
  dpkg -i bottom_$VERSION-1_$arch.deb >/dev/null 2>&1
  echo -e "${GREEN} bottom installed ${CLEAR}"
fi
