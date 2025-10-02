#!/bin/bash

VERSION=0.9.1
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=linux_arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=linux_amd64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing duf"
  curl -LOsS https://github.com/muesli/duf/releases/download/v$VERSION/duf_$VERSION_$arch.deb
  dpkg -i duf_$VERSION_$arch.deb >/dev/null 2>&1
  echo -e "${GREEN} duf installed ${CLEAR}"
fi
