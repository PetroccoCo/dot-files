
" EVERYTHING PRIOR TO THIS POINT IS ADDED BY git://github.com/amix/vimrc.git using the ultimate install script!
"
" EVERYTHING AFTER THIS POINT IS IN THE dot_files/vimrc file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Override the Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/dot-files/vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc

" Have pathogen infect the bundle directory
call pathogen#infect('~/.vim/bundle')
call pathogen#helptags()

" Add the syntax files and such
set runtimepath+=~/.vim/syntax
source ~/.vim/syntax/filetypes.vim

" actionscript language ctags settings
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction

" Set my prefferred spacing settings at the end so nothing overwrites them
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Add my workspace to the path (done in the install.sh script)
" These enable per dir .vimrc
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set nofoldenable
