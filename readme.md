How to use:

1.- go to root directory

```
cd ~
```

2.- clone repo

```
git clone https://github.com/artgpz/dotfiles.git
```

3.- go to dotfiles/debian directory and run kickstart

```
cd dotfiles/debian
chmod +x kickstart # if needed for this and other scripts
./kickstart.sh
```

4.- make a nice cuppa while you wait

5.- install the desired configurations

```
cd ~/dotfiles
stow neovim
stow tmux
stow zsh
```
