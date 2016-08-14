#managing
i manage mine with [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.

#installing
stow is available for all linux and most other unix like distributions via your package manager.

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and [build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.

#how it works
by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/.dotfiles`. and all stow commands should be executed in that tall the oh-my-zsh settings

`stow oh-my-zsh`

install zsh settings for the root user

`sudo stow zsh -t /root`

install vim

`stow vim`

uninstall vim

`stow -D vim`
