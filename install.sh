#!/bin/bash

## git submodules gives me all sorts of trouble ...
## the solution appears to be, blow all the dirs away and have git recreate it

## ensure all submodules are current and pulled in
git submodule update --init --recursive

## move all files to .bak extenstions
mv -v	~/.ackrc	~/.ackrc.bak
mv -v	~/.bash_aliases	~/.bash_aliases.bak
mv -v	~/.bash_logout	~/.bash_logout.bak
mv -v	~/.bashrc   	~/.bashrc.bak
mv -v	~/.bash_profile   	~/.bash_profile.bak
mv -v	~/.vim_runtime	~/.vim_runtime.bak
mv -v	~/.vim          ~/.vim.bak
mv -v	~/.viminfo	~/.viminfo.bak
mv -v	~/.vimrc	~/.vimrc.bak
mv -v	~/.ctags	~/.ctags.bak
mv -v	~/.cvsignore	~/.cvsignore.bak
mv -v	~/.gitconfig	~/.gitconfig.bak
mv -v	~/.git_template	~/.git_template.bak

## link all files to proper places
ln	-vs	$PWD/ackrc	~/.ackrc
ln	-vs	$PWD/bash_aliases	~/.bash_aliases
ln	-vs	$PWD/bash_logout 	~/.bash_logout
ln	-vs	$PWD/bashrc	~/.bashrc
ln	-vs	$PWD/bash_profile	~/.bash_profile
ln	-vs	$PWD/vim_runtime	~/.vim_runtime
ln	-vs	$PWD/vim  ~/.vim
ln	-vs	$PWD/viminfo	~/.viminfo
ln	-vs	$PWD/ctags		~/.ctags
ln	-vs	$PWD/cvsignore		~/.cvsignore
ln	-vs	$PWD/gitconfig		~/.gitconfig
ln	-vs	$PWD/git_template		~/.git_template

## Don't link this as it is overwritten by the install_awesome_vimrc.sh
#ln	-vs	$PWD/vimrc		~/.vimrc

## reset the terminal
source ~/.bashrc

## install ultimate vimrc
sh ~/.vim_runtime/install_awesome_vimrc.sh

## Append to the vimrc so we can have everything co-exist nicely
cat vimrc >> ~/.vimrc
## Aod all src directories to the vim path for easy finding
#find ~/workspace/ -maxdepth 2 -path "*src" -type d | sed -e 's/.*/set path +=\0\/**/' >> ~/.vimrc
