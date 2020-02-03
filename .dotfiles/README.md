# Darren's Dotfiles

The dotfiles in this folder rely on a [bare repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) instead of symlinks.

The `config` alias is used for managing dotfiles in the home directory.

For example:

```sh
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```


This setup was inspired by this [dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

## Setup

I maintain a separate `.zshrc` for personal (`.zshrc.personal`) and work (`.zshrc.work`). To pick one, run:

```sh
ln -siv .zshrc.personal .zshrc
```


## TODO: 
- document/automate installing dotfiles on a new system
- get path autocompletion to work for the `config` alias

