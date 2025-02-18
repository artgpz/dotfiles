#!/bin/bash

USER=$1

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

if [ $# -ne 1 ]; then
  echo "${RED}Usage: $0 user${CLEAR}"
  exit 1
fi

if ! id -u "$USER" &>/dev/null; then
  echo "${RED}Error: User '$USER' does not exist${CLEAR}"
  exit 1
fi

if [[ -e /etc/debian_version ]]; then
  echo -e "${BLUE}Hello :) "
  echo -e "This script will install:${CLEAR}"
  echo -e "zsh${CLEAR}"
  echo -e "docker${CLEAR}"
  echo -e "utilities${CLEAR}"
  echo -e "set websites folder${CLEAR}"
else
  echo "Couldn't determine your OS or it is unsupported by this script."
  exit 1
fi

./zsh/bin/zsh_config.sh $USER
./debian/bin/kickstart.sh
./tmux/bin/tmux_config.sh
./docker/bin/install.sh
./debian/bin/web_config.sh $USER
