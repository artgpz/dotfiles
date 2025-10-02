#!/bin/bash

VERSION=0.11.4
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=linux-arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=linux-x86_64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing nvim"
  curl -OLsS https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-$arch.tar.gz
  tar xzvf nvim-linux-arm64.tar.gz
  mv ./nvim-linux-arm64/bin/nvim /usr/local/bin
  #NOTE: add export PATH=$PATH:/usr/local/go/bin
  echo -e "${GREEN} nvim installed ${CLEAR}"
fi
