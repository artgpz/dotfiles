#!/bin/bash

https://github.com/jesseduffield/lazygit/releases/download/v0.59.0/lazygit_0.59.0_linux_x86_64.tar.gz
VERSION=0.59.0
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
  tar -xf lazygit_$VERSION\_$arch.tar.gz
  mv lazygit /usr/local/bin/lazygit
  echo -e "${GREEN} lazygit installed ${CLEAR}"
fi
