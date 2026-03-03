#!/bin/bash

VERSION=0.11.6
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
  tar xzvf nvim-$arch.tar.gz
  mv ./nvim-$arch/bin/nvim /usr/local/bin
  mv ./nvim-$arch/lib/nvim /usr/local/lib
  mv ./nvim-$arch/share/applications /usr/local/share
  mv ./nvim-$arch/share/icons /usr/local/share
  mv ./nvim-$arch/share/man /usr/local/share
  mv ./nvim-$arch/share/nvim /usr/local/share
  echo -e "${GREEN} nvim installed ${CLEAR}"
fi
