#!/bin/bash

VERSION=1.25.1
arch=none
if [[ "$ARCH" = 'aarch64' ]]; then
  arch=linux-arm64
fi

if [[ "$ARCH" = 'x86_64' ]]; then
  arch=linux-amd64
fi

if [[ "$arch" != 'none' ]]; then
  echo -e "installing go"
  curl -OLsS https://go.dev/dl/go$VERSION.$arch.tar.gz
  tar -C /usr/local -xf go$VERSION.$arch.tar.gz
  #NOTE: add export PATH=$PATH:/usr/local/go/bin
  echo -e "${GREEN} go installed ${CLEAR}"
fi
