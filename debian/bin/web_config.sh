#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

if [ $# -ne 1 ]; then
  echo "Usage: $0 <user[:group]>"
  exit 1
fi

OWNER="$1"

if [[ "$owner" == *":"* ]]; then
  USER="${owner%%:*}"
  GROUP="${owner#*:}"
else
  USER="$owner"
  GROUP="$user"
fi

if ! id -u "$USER" &>/dev/null; then
  echo "Error: User '$USER' does not exist"
  exit 1
fi

if ! getent group "$GROUP" &>/dev/null; then
  echo "Error: Group '$GROUP' does not exist"
  exit 1
fi

echo -e "${BLUE}configuring web for ${USER} user${CLEAR}"
cd ~
mkdir websites
cd websites
mkdir secrets
cd ~
chown -R "${USER}:${GROUP}" websites
# need to validate there is an ssh key and try login at git@github.com
echo -e "${GREEN}finished!${CLEAR}"
