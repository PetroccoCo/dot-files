""""""""""""""""""""""""""""""
" => Actionscript section
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.as set filetype=actionscript
au! Syntax actionscript source ~/.vim_runtime/vimrcs/actionscript.vim
au BufRead,BufNewFile *.mxml set filetype=mxml
au! Syntax mxml source ~/.vim_runtime/vimrcs/mxml.vim
