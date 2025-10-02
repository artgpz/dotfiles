#!/bin/bash

export RED='\033[0;31m'
export GREEN='\033[0;32m'
export BLUE='\033[0;34m'
export CLEAR='\033[0m'
export USER=$1

if [[ -e /etc/debian_version ]]; then
  echo -e "${BLUE}The Debian script will start now :) "
  echo -e "Might take a while, so be patient ${CLEAR}"
else
  echo "Couldn't determine your OS or it is unsupported by this script."
  exit 1
fi

# Get APT dependencies
./dependencies/apt.sh
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

./dependencies/go.sh
./dependencies/sops.sh
./dependencies/bottom.sh
./dependencies/duf.sh
./dependencies/dust.sh
./dependencies/lazygit.sh
./dependencies/lsd.sh
./dependencies/nvim.sh

#split by arch to download from packages
# if [[ "$ARCH" = 'aarch64' ]]; then
#
#   echo -e "installing go"
#   curl -OLsS https://go.dev/dl/go1.25.1.linux-arm64.tar.gz
#   tar -C /usr/local -xf go1.25.1.linux-arm64.tar.gz
#   #NOTE: add export PATH=$PATH:/usr/local/go/bin
#   echo -e "${GREEN} go installed ${CLEAR}"
#
#   echo -e "installing sops"
#   curl -LOsS https://github.com/getsops/sops/releases/download/v3.11.0/sops_3.11.0_arm64.deb
#   dpkg -i sops_3.10.2_arm64.deb >/dev/null 2>&1
#   echo -e "${GREEN} sops installed ${CLEAR}"
#
#   echo -e "installing bottom"
#   curl -LOsS https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_arm64.deb
#   dpkg -i bottom_0.10.2-1_arm64.deb >/dev/null 2>&1
#   echo -e "${GREEN} bottom installed ${CLEAR}"
#
#   echo -e "installing dust"
#   curl -LOsS https://github.com/bootandy/dust/releases/download/v1.2.0/dust-v1.2.0-aarch64-unknown-linux-musl.tar.gz
#   tar -xf dust-v1.2.0-aarch64-unknown-linux-musl.tar.gz
#   mv dust-v1.2.0-aarch64-unknown-linux-musl/ /usr/local/dust
#   echo -e "${GREEN} dust installed ${CLEAR}"
#
#   echo -e "installing lazygit"
#   curl -LOsS https://github.com/jesseduffield/lazygit/releases/download/v0.50.0/lazygit_0.50.0_Linux_arm64.tar.gz
#   tar -xf lazygit_0.50.0_Linux_arm64.tar.gz
#   mv lazygit /usr/local/bin/lazygit
#   echo -e "${GREEN} lazygit installed ${CLEAR}"
#
#   echo -e "installing duf"
#   curl -LOsS https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_arm64.deb
#   dpkg -i duf_0.8.1_linux_arm64.deb >/dev/null 2>&1
#   echo -e "${GREEN} duf installed ${CLEAR}"
#
#   echo -e "installing lsd"
#   curl -LOsS https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd_1.1.5_arm64.deb
#   dpkg -i lsd_1.1.5_arm64.deb >/dev/null 2>&1
#   echo -e "${GREEN} lsd installed ${CLEAR}"
#
# fi
#
# #split by arch to download from packages
# if [[ "$ARCH" = 'x86_64' ]]; then
#
#   echo -e "installing go"
#   curl -OLsS https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
#   tar -C /usr/local -xf go1.24.3.linux-amd64.tar.gz
#   #NOTE: add export PATH=$PATH:/usr/local/go/bin
#   echo -e "${GREEN} go installed ${CLEAR}"
#
#   echo -e "installing sops"
#   curl -LOsS https://github.com/getsops/sops/releases/download/v3.10.2/sops_3.10.2_amd64.deb
#   dpkg -i sops_3.10.2_amd64.deb >/dev/null 2>&1
#   echo -e "${GREEN} sops installed ${CLEAR}"
#
#   echo -e "installing bottom"
#   curl -LOsS https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb
#   dpkg -i bottom_0.10.2-1_amd64.deb >/dev/null 2>&1
#   echo -e "${GREEN} bottom installed ${CLEAR}"
#
#   echo -e "installing dust"
#   curl -LOsS https://github.com/bootandy/dust/releases/download/v1.2.0/du-dust_1.2.0-1_amd64.deb
#   dpkg -i du-dust_1.2.0-1_amd64.deb >/dev/null 2>&1
#   echo -e "${GREEN} dust installed ${CLEAR}"
#
#   echo -e "installing lazygit"
#   curl -LOsS https://github.com/jesseduffield/lazygit/releases/download/v0.50.0/lazygit_0.50.0_Linux_x86_64.tar.gz
#   tar -xf lazygit_0.50.0_Linux_x86_64.tar.gz
#   mv lazygit /usr/local/bin/lazygit
#   echo -e "${GREEN} lazygit installed ${CLEAR}"
#
#   echo -e "installing duf"
#   curl -LOsS https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
#   dpkg -i duf_0.8.1_linux_amd64.deb >/dev/null 2>&1
#   echo -e "${GREEN} duf installed ${CLEAR}"
#
#   echo -e "installing lsd"
#   curl -LOsS https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd_1.1.5_amd64.deb
#   dpkg -i lsd_1.1.5_amd64.deb >/dev/null 2>&1
#   echo -e "${GREEN} lsd installed ${CLEAR}"
#
# fi
#
# echo -e "installing neovim"
# echo -e "this will take a few minutes..."
# git clone https://github.com/neovim/neovim >/dev/null 2>&1
# cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo >/dev/null 2>&1
# cd build
# cpack -G DEB >/dev/null 2>&1
#
# if [[ "$ARCH" = 'x86_64' ]]; then
#   dpkg -i nvim-linux-x86_64.deb >/dev/null 2>&1
# fi
# if [[ "$ARCH" = 'aarch64' ]]; then
#   dpkg -i nvim-linux-arm64.deb >/dev/null 2>&1
# fi
# echo -e "${GREEN} neovim installed ${CLEAR}"
cd

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
