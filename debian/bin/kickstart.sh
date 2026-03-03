#!/bin/bash

export RED='\033[0;31m'
export GREEN='\033[0;32m'
export BLUE='\033[0;34m'
export CLEAR='\033[0m'
export USER=$1

SCRIPTDIR=~/dotfiles/debian/bin/dependencies

if [[ -e /etc/debian_version ]]; then
  echo -e "${BLUE}The Debian script will start now :) "
  echo -e "Might take a while, so be patient ${CLEAR}"
else
  echo "Couldn't determine your OS or it is unsupported by this script."
  exit 1
fi

# Get APT dependencies
$SCRIPTDIR/apt.sh

#to remove verbosity installing with apt-get
install="apt-get -o Dpkg::Use-Pty=0 -qq install -y"
export ARCH=$(uname -m)

echo -e "Updating and upgrading apt (you might need to press enter after 30s or so)"
apt-get -qq update -y >/dev/null 2>&1
apt-get -qq upgrade -y >/dev/null 2>&1
echo -e "${GREEN} apt upgraded ${CLEAR}"

#caddy and xcaddy
echo -e "Installing caddy"
$install debian-keyring debian-archive-keyring apt-transport-https curl >/dev/null 2>&1
curl -1sLfS 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg >/dev/null 2>&1
curl -1sLfS 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list >/dev/null 2>&1
curl -1sLfS 'https://dl.cloudsmith.io/public/caddy/xcaddy/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-xcaddy-archive-keyring.gpg >/dev/null 2>&1
curl -1sLfS 'https://dl.cloudsmith.io/public/caddy/xcaddy/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-xcaddy.list >/dev/null 2>&1
apt-get update >/dev/null 2>&1

#utilities
echo -e "Utilities to install: $UTILITIES"
for i in $UTILITIES; do
  $install $i >/dev/null 2>&1
  echo -e "$i installed"
done

mkdir ~/downloads
cd ~/downloads

echo -e "insalling zoxide"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash >/dev/null 2>&1
echo -e "zoxide installed"

echo -e "insalling mcfly"
curl -LfsS https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | bash -s -- --git cantino/mcfly >/dev/null 2>&1
echo -e "mcfly installed"

echo -e "insalling pnpm"
curl -fsSL https://get.pnpm.io/install.sh | bash - >/dev/null 2>&1
echo -e "pnpm installed"

echo -e "insalling rclone"
curl https://rclone.org/install.sh | bash >/dev/null 2>&1
echo -e "rclone installed"

echo -e "insalling lazydocker"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo -e "${GREEN} lazydocker installed ${CLEAR}"

$SCRIPTDIR/go.sh
$SCRIPTDIR/sops.sh
$SCRIPTDIR/bottom.sh
$SCRIPTDIR/duf.sh
$SCRIPTDIR/dust.sh
$SCRIPTDIR/lazygit.sh
$SCRIPTDIR/lsd.sh
$SCRIPTDIR/nvim.sh

cp ~/dotfiles/debian/.zshrc ~/.zshrc

cd ~/downloads
echo -e "installing lazyvim"
git clone https://github.com/LazyVim/starter ~/.config/nvim >/dev/null 2>&1
echo -e "${GREEN} lazyvim installed"

cd ~/dotfiles
cp .stow-global-ignore ~/.stow-global-ignore

rm -rf ~/.config/nvim

if [[ -n "$USER" ]]; then
  echo -e "insalling zoxide on ${USER}"
  su $USER -c "curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh >/dev/null 2>&1"
  echo -e "zoxide installed"
fi

echo -e "Install script has now completed"
echo -e "You may update these tools manually: restic, age"
echo -e "To install node do: pnpm env use --global lts"
