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
au BufNewFile,BufRead *.properties set filetype=groovy
au BufNewFile,BufRead *.gradle set filetype=groovy

""""""""""""""""""""""""""""""
" => Apache and other logs section
""""""""""""""""""""""""""""""
au! Syntax httplog source ~/.vim/syntax/apachelogs.vim
au BufRead *.log setf httplog 

""""""""""""""""""""""""""""""
" => Flash logs section
""""""""""""""""""""""""""""""
au! Syntax flashlog source ~/.vim/syntax/flashlogs.vim
au BufRead *.flashlog setf flashlog 
