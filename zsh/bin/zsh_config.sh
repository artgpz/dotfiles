#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

echo -e "Configuring zsh"

echo -e "Installing zsh..."
apt-get -o Dpkg::Use-Pty=0 -qq install -y zsh >/dev/null 2>&1
echo -e "${GREEN} zsh installed ${CLEAR}"
echo -e "making zsh default shell"
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
echo -e "zsh set as default shell"

echo -e "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo -e "${GREEN}oh-my-zsh installed${CLEAR}"

echo -e "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo -e "${GREEN}zsh-autosuggestions installed${CLEAR}"

echo -e "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo -e "${GREEN}zsh-syntax-highlighting installed${CLEAR}"

echo -e "Installing zsh-fast-syntax-highlighting"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
echo -e "${GREEN}zsh-fast-syntax-highlighting installed${CLEAR}"

echo -e "Installing zsh-autocomplete"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
echo -e "${GREEN}zsh-autocomplete installed${CLEAR}"

cp ~/dotfiles/zsh/.zshrc ~/.zshrc

echo -e "${BLUE}zsh config completed :)${CLEAR}"
