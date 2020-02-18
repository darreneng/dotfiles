# Darren's Dotfiles

Instead of symlinking files into the home directory, we rely on some trickery with git's working tree.

This setup was originally inspired by this [dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles) but doesn't follow it exactly.

## Setup

### Starting from scratch

Clone the repository without checking out a working tree. Then configure it so that:

- the home directory is the default working tree.
- untracked files aren't displayed by default when running `git status`. This is important because the home directory is the working tree, so we don't want to show everything.

```sh
cd ~
git clone --no-checkout https://github.com/darreneng/dotfiles.git
git config --local core.worktree $HOME
git config --local status.showUntrackedFiles no
```

This part might cause merge conflicts!

```sh
cd ~
git --git-dir=$HOME/dotfiles/.git checkout
```

To make dotfiles easier to work with, both `.zshrc` files define a `dot` alias that can be run from anywhere.

### Updating the repo

This should also be run when first setting up the repository.

```sh
dot submodule init
dot pull --recurse-submodules
```

### Pushing updates

```sh
dot status
dot add .vimrc
dot commit -m "Add vimrc"
dot push
```

## vim related stuff

vim packages are managed with vim's built-in system and git submodules

### Adding submodules:

```
cd ~/.vim/pack/foo/start
dot submodule add <plugin-repo-url>
```

### Updating submodules:

```
dot submodule update --remote --merge
dot commit
```

### Deleting submodules

Assuming the plugin is located at `~/.vim/pack/foo/start/vim-plugin-name/`

```
cd ~/.vim/pack/foo/start
dot submodule deinit vim-plugin-name/
dot submodule rm vim-plugin-name/
```

## zsh

I maintain a separate `.zshrc` for personal (`.zshrc.personal`) and work (`.zshrc.work`). To pick one, run:

```sh
ln -siv .zshrc.personal .zshrc
# or
ln -siv .zshrc.work .zshrc
```
