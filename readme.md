## Welcome to dotfiles for Debian

This is not properly dotfiles for your computer, although you can get a few ideas to tailor it to your needs.

### How to use

This is for a VM where the user will be assumed as "deploy"

If you're already inside the deploy user then:

1.- switch users and install git

```
sudo -s \
apt update \
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
cd dotfiles \
chmod +x kickstart.sh \ # if needed for this and other scripts
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

## Dependencies

This automates the installation of the following dependencies:

| Name                                                      | Description                                                                                                                             |
| --------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| [Age](https://github.com/FiloSottile/age)                 | A simple, modern and secure encryption tool (and Go library) with small explicit keys, no config options, and UNIX-style composability. |
| [Bottom](https://github.com/jesseduffield/lazygit)        | Cross-platform graphical process/system monitor.                                                                                        |
| [Caddy](https://caddyserver.com/)                         | Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS.                                                          |
| [Curl](https://curl.se/docs/manpage.html)                 | Tool for transferring data from or to a server using URLs.                                                                              |
| [Duf](https://github.com/muesli/duf)                      | Alternative and better df.                                                                                                              |
| [Dust](https://github.com/bootandy/dust)                  | A more intuitive version of du in rust.                                                                                                 |
| [Fzf](https://github.com/junegunn/fzf)                    | A command-line fuzzy finder.                                                                                                            |
| [Git](https://git-scm.com/downloads)                      | Distributed version control system.                                                                                                     |
| [Go](https://go.dev/)                                     | Go language.                                                                                                                            |
| [Lazydocker](https://github.com/jesseduffield/lazydocker) | The lazier way to manage everything docker.                                                                                             |
| [Lazygit](https://github.com/jesseduffield/lazygit)       | Simple TUI for git commands                                                                                                             |
| [LSD](https://github.com/lsd-rs/lsd)                      | Alternative to ls.                                                                                                                      |
| [McFLy](https://github.com/cantino/mcfly)                 | Fly through your shell history. Great Scott!                                                                                            |
| [Neovim](https://github.com/neovim/neovim)                | Vim-fork focused on extensibility and usability.                                                                                        |
| [Pnpm](https://pnpm.io/)                                  | Fast, disk space efficient npm package manager.                                                                                         |
| [Rclone](https://github.com/rclone/rclone)                | Command-line program to sync files and directories to and from different cloud storage providers.                                       |
| [Restic](https://github.com/restic/restic)                | Fast, secure, efficient backup program.                                                                                                 |
| [Sops](https://github.com/getsops/sops)                   | Simple and flexible tool for managing secrets.                                                                                          |
| [Stow](https://www.gnu.org/software/stow/)                | A symlink farm manager, helps manage dotfiles.                                                                                          |
| [Tmux](https://github.com/tmux/tmux/wiki)                 | A terminal multiplexer.                                                                                                                 |
| [Wireguard](https://www.wireguard.com)                    | An extremely simple yet fast and modern VPN.                                                                                            |
| [Zoxide](https://github.com/ajeetdsouza/zoxide)           | Alternative and smarter cd.                                                                                                             |
