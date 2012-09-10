dot-files
=========
This repository sets up all my commonly used dot files.
Currently the following files are maintained:

bash_aliases:
  - Infrequently used but ensures any aliases are consistent

bash_logout:
  - Not actively being used

bashrc:
  - Shell prompt colors
  - Shell prompt title and command prompt settings
    - Prompt includes current git branch
  - Many bash history settings
  - A couple of bash functions are defined:
    - tt for tailing tomcat logs
    - vctt for tailing red5 logs
    - ebell for intelligent ringing of the terminal bell or emailing a user based on a timeout

ctags:
  - Global ctags configuration operations

cvsignore:
  - A global ignore file, despite the name this is used by git among other applications

git_template:
  - A directory containing my git hooks
    - Currently this is setup to rebuild ctags after changes to the repository

gitconfig:
  - My global git config

install.sh:
  - Run this from inside the dot-files directory to automagically install all these files
  - Current files are renamed to .bak ie: .bashrc.bak
  - New files are linked to the dot-files directory for easy updating
  
vim:
  - This directory contains all the addition vim files I like in addition to amix's wonderful vim setup
  - Currently there are:
    - Syntax files for actionscript and mxml files
    - Vim-fugitive to  automatically import the ctags

vim_runtime:
  - This is amix's (https://github.com/amix/vimrc) vim configuration
  - There is a lot in here and I highly recommend reading the README.md to start to understand what is going on

vimrc:
  - This file get appended to the one amix generates to setup some custom settings
