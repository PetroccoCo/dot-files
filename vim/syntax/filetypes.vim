""""""""""""""""""""""""""""""
" => Actionscript section
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.as set filetype=actionscript
au! Syntax actionscript source ~/.vim/syntax/actionscript.vim
au BufRead,BufNewFile *.mxml set filetype=mxml
au! Syntax mxml source ~/.vim/syntax/mxml.vim

""""""""""""""""""""""""""""""
" => Gradle section
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.gradle setf groovy
