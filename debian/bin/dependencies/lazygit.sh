#!/bin/bash

VERSION=0.55.1
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=linux_arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=linux_x86_64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing lazygit"
  curl -LOsS https://github.com/jesseduffield/lazygit/releases/download/v$VERSION/lazygit_$VERSION_$arch.tar.gz
  tar -xf lazygit_$VERSION_$arch.tar.gz
  mv lazygit /usr/local/bin/lazygit
  echo -e "${GREEN} lazygit installed ${CLEAR}"
fi
