#!/bin/bash

VERSION=0.11.5
arch=none

if [[ "$ARCH" = $arch'aarch64' ]]; then
  arch=linux-arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=linux-x86_64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing nvim"
  curl -OLsS https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-$arch.tar.gz
  sudo rm -rf /opt/nvim-$arch
  sudo tar -C /opt -xzf nvim-$arch.tar.gz
  echo -e "${GREEN} nvim installed ${CLEAR}"
fi
