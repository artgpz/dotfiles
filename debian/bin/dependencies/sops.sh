#!/bin/bash

VERSION=3.11.0
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=amd64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing sops"
  curl -LOsS https://github.com/getsops/sops/releases/download/v$VERSION/sops_$VERSION_$arch.deb
  dpkg -i sops_$VERSION_$arch.deb >/dev/null 2>&1
  echo -e "${GREEN} sops installed ${CLEAR}"
fi
