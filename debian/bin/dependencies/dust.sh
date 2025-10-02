#!/bin/bash

VERSION=1.2.3
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=aarch64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=x86_64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing dust"
  curl -LOsS https://github.com/bootandy/dust/releases/download/v$VERSION/dust-v$VERSION-$arch-unknown-linux-musl.tar.gz
  tar -xf dust-v$VERSION-$arch-unknown-linux-musl.tar.gz
  mv dust-v$VERSION-$arch-unknown-linux-musl/ /usr/local/dust
  echo -e "${} dust installed ${CLEAR}"
fi
