# Darren's Dotfiles

The dotfiles in this folder rely on a [bare repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) instead of symlinks.

The `dot` alias is used for managing dotfiles in the home directory.

For example:

```sh
dot status
dot add .vimrc
dot commit -m "Add vimrc"
dot push
```

This setup was inspired by this [dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

## Setup

### Starting from scratch

```sh
mkdir -p .dotfiles/.git
git clone --bare https://github.com/darreneng/dotfiles.git ~/.dotfiles/.git

# copy the alias from ~/.zshrc and define in current scope
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'

# checkout content. this may cause merge conflicts
dot checkout

dot config --local status.showUntrackedFiles no
```

### Updating the repo

```
dot pull --recurse-submodules
dot submodule init
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

### zsh

I maintain a separate `.zshrc` for personal (`.zshrc.personal`) and work (`.zshrc.work`). To pick one, run:

```sh
ln -siv .zshrc.personal .zshrc
# or
ln -siv .zshrc.work .zshrc
```
