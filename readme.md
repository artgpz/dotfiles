How to use:

1.- switch users and install git

```
sudo -s
apt update
apt install git
```

2.- go to root directory

```
cd ~
```

3.- clone repo

```
git clone https://github.com/artgpz/dotfiles.git
```

4.- go to dotfiles/debian/bin directory and run kickstart

```
cd dotfiles/debian/bin
chmod +x kickstart.sh # if needed for this and other scripts
./kickstart.sh
```

5.- make a nice cuppa while you wait

6.- install the desired configurations

```
cd ~/dotfiles
stow neovim
stow tmux
stow zsh
```
