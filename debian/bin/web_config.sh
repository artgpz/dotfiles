#!/bin/bash

OWNER=$1
USER=$1

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

if [ $# -ne 1 ]; then
  echo "Usage: $0 <user[:group]>"
  exit 1
fi

if [[ "$OWNER" == *":"* ]]; then
  USER="${OWNER%%:*}"
  GROUP="${OWNER#*:}"
else
  USER="$OWNER"
  GROUP="$OWNER"
fi

if ! id -u "$USER" &>/dev/null; then
  echo -e "${RED}Error: User '$USER' does not exist${CLEAR}"
  exit 1
fi

if ! getent group "$GROUP" &>/dev/null; then
  echo -e "${RED}Error: Group '$GROUP' does not exist${CLEAR}"
  exit 1
fi

echo -e "${BLUE}Configuring websites folder for ${USER} user${CLEAR}"
cd /home/${USER}/
mkdir websites
cd websites
mkdir secrets
cd /home/${USER}/
chown -R "${USER}:${GROUP}" websites
# need to validate there is an ssh key and try login at git@github.com
echo -e "${GREEN}finished!${CLEAR}"
