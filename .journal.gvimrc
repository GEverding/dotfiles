
set spell spelllang=en_ca
autocmd BufEnter * silent! lcd %:p:h
set lines=50 columns=80 

" Use vimrc if available {
    if filereadable(expand("~/.vimrc"))
        source ~/.vimrc
    endif
" }
