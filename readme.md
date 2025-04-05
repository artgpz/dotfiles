## Welcome to dotfiles for Debian

This is not properly dotfiles for your computer, although you can get a few ideas to tailor it to your needs.

### How to use

This is for a VM where the user will be assumed as "deploy"

If you're already inside the deploy user then:

1.- switch users and install git

```
sudo -s
apt update
apt install git
```

If you don't have a "deploy" user

1.- create deploy user and install git

```
adduser deploy #follow instructions
apt update
apt install git
```

2.- go to root directory

```
cd ~
```

3.- clone this repo

```
git clone https://github.com/artgpz/dotfiles.git
```

4.- go to dotfiles directory and run kickstart

```
cd dotfiles
chmod +x kickstart.sh # if needed for this and other scripts
./kickstart.sh deploy # deploy is the user
```

(You will need to provide a password for deploy)

5.- make a nice cuppa while you wait

6.- install the desired configurations

```
cd ~/dotfiles
stow neovim
stow tmux
stow zsh (you may have to move .zshrc: mv ~/.zshrc ~/.old.zshrc)
```

7.- exit the root user and deploy user:

```
exit
exit
```

8.- log back in again and install zoxide in the deploy user

```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

```
