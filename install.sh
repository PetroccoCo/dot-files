#!/bin/bash

## move all files to .bak extenstions
mv -v	~/.bash_aliases	~/.bash_aliases.bak
mv -v	~/.bash_logout	~/.bash_logout.bak
mv -v	~/.bashrc   	~/.bashrc.bak
mv -v	~/.vim_runtime	~/.vim_runtime.bak
mv -v	~/.vim_syntax	~/.vim_syntax.bak
mv -v	~/.viminfo	~/.viminfo.bak
mv -v	~/.vimrc	~/.vimrc.bak
mv -v	~/.ctags	~/.ctags.bak

## link all files to proper places
ln	-vs	$PWD/bash_aliases	~/.bash_aliases
ln	-vs	$PWD/bash_logout 	~/.bash_logout
ln	-vs	$PWD/bashrc	~/.bashrc
ln	-vs	$PWD/vim_runtime	~/.vim_runtime
ln	-vs	$PWD/vim_syntax	~/.vim_syntax
ln	-vs	$PWD/viminfo	~/.viminfo
## Don't link this as it is overwritten by the install_awesome_vimrc.sh
#ln	-vs	$PWD/vimrc		~/.vimrc
ln	-vs	$PWD/ctags		~/.ctags

## reset the terminal
source ~/.bashrc

## install ultimate vimrc
sh ~/.vim_runtime/install_awesome_vimrc.sh

## Append the vimrc
cat vimrc >> ~/.vimrc
