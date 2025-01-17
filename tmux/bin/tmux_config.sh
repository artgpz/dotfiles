#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

echo -e "Configuring tmux"

echo -e "Installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo -e "${GREEN}tpm installed${CLEAR}"
