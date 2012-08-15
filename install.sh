#!/bin/bash

## move all files to .bak extenstions
mv	~/.bash_aliases	~/.bash_aliases.bak
mv	~/.bash_logout	~/.bash_logout.bak
mv	~/.bashrc   	~/.bashrc.bak
mv	~/.vim_runtime	~/.vim_runtime.bak
mv	~/.viminfo	   	~/.viminfo.bak
mv	~/.vimrc	   	~/.vimrc.bak

## link all files to proper places
ln	-s	bash_aliases	~/.bash_aliases
ln	-s	bash_logout 	~/.bash_logout
ln	-s	bashrc		    ~/.bashrc
ln	-s	vim_runtime	    ~/.vim_runtime
ln	-s	viminfo		    ~/.viminfo
ln	-s	vimrc		    ~/.vimrc

## reset the terminal
source ~/.bashrc

## install ultimate vimrc
sh ./vim_runtime/install_awesome_vimrc.sh
