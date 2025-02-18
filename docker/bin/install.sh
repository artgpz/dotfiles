#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'
UTILITIES="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
install="apt-get -o Dpkg::Use-Pty=0 -qq install -y"

echo -e "${BLUE}Installing Docker${CLEAR}"

apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
  tee /etc/apt/sources.list.d/docker.list >/dev/null
apt-get update

for i in $UTILITIES; do
  $install $i >/dev/null 2>&1
  echo -e "$i installed"
done

echo -e "${BLUE}Docker installed${CLEAR}"
