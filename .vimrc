" lOcal .vimrc
" Author: Garrett Everding <garrett.everding92@gmail.com>

set nocp
syntax on
filetype plugin indent on

inoremap jj <ESC>

if has("gui_running")
  colorscheme molokai
else
  set clipboard=unnamed
  colorscheme molokai
endif

let g:snips_author = 'Garrett Everding <garrett.everding92@gmail.com>'


set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles {
  Bundle 'gmarik/vundle'

  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  if executable('ack-grep')
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    Bundle 'mileszs/ack.vim'
  elseif executable('ack')
    Bundle 'mileszs/ack.vim'
  endif
  Bundle 'scrooloose/nerdtree'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'spf13/vim-colors'
  Bundle 'flazz/vim-colorschemes'

  Bundle 'tpope/vim-surround'
  Bundle 'AutoClose'
  Bundle 'kien/ctrlp.vim'
  "Bundle 'vim-scripts/sessionman.vim'
  Bundle 'matchit.zip'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'godlygeek/csapprox'
  Bundle 'corntrace/bufexplorer'
  Bundle 'mbbill/undotree'
  Bundle 'myusuf3/numbers.vim'
  Bundle 'nathanaelkane/vim-indent-guides'

  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-fugitive'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'godlygeek/tabular'

  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/neosnippet'
  Bundle 'honza/snipmate-snippets'
  Bundle 'carlosvillu/coffeScript-VIM-Snippets'

  Bundle 'leshill/vim-json'

  "HTML
  Bundle 'digitaltoad/vim-jade'
  Bundle 'amirh/HTML-AutoCloseTag'

  "CSS
  Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
  "Bundle 'groenewege/vim-less'
  "Coffee
  Bundle 'kchmck/vim-coffee-script'
  "Javascript
  Bundle 'pangloss/vim-javascript'
  "Bundle 'briancollins/vim-jst'

  "Python
  "Bundle 'python.vim'
  "Bundle 'klen/python-mode'
  "Bundle 'python_match.vim'
  "Bundle 'pythoncomplete'

  "Haskell
  Bundle 'lukerandall/haskellmode-vim'

  "Misc
  Bundle 'tpope/vim-markdown'
  Bundle 'spf13/vim-preview'
"}

set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every four columns
set softtabstop=2               " let backspace delete indent
set hlsearch
set incsearch
set hidden
set ruler
set history=1000
set cursorline
set dir=~/.vim/swap
set backupdir=~/.vim/tmp
set mouse=a
set shortmess+=filmnrxoOtT                         " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash    " better unix / windows compatibility
set virtualedit=onemore                             " allow for cursor beyond last character"
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc presentet history=1000
set foldenable
set colorcolumn=80
set showmode

" Open to last position
au BufWinLeave *.* silent!  mkview
au BufWinEnter *.* silent! loadview

if has ('persistent_mode')
  set undofile
  set undolevel=1000
  set undoeload=10000
endif
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav
endif



au BufEnter,BufNew,BufRead *.coffee set filetype=coffee
au BufEnter,BufNew,BufRead *.jade set filetype=jade
au BufEnter,BufNew,BufRead *.js set filetype=javascript
au BufEnter,BufNew,BufRead *.ts set filetype=typecript

au BUfEnter,BufNew,BufRead *.hs set syntax=haskell
au BufEnter,BufNew,BufRead *.yml set syntax=yaml
au BufEnter,BufNew,BufRead *.do set syntax=sh
au BufEnter,BufNew,BufRead *.less set syntax=less


" Re-Mappings {
    let mapleader= ','
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    nmap <silent> <leader>/ :nohlsearch<CR>

    vnoremap < <gv
    vnoremap > >gv

    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

    "Switch number mode
    nnoremap <F3> :NumbersToggle<CR>

    map <Leader>= <C-w>=
    " For when I forget to sudo
    cmap w!! w !sudo tee % >/dev/null
" }



" Plugins {{{

" OmniComplete {
  if has("autocmd") && exists("+omnifunc")
   autocmd Filetype *
     \if &omnifunc == "" |
     \setlocal omnifunc=syntaxcomplete#Complete |
     \endif
  endif

  hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
  hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
  hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

  " some convenient mappings
  inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
  inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt=menu,preview,longest


  " neocomplcache {
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_enable_auto_delimiter = 1
  let g:neocomplcache_max_list = 15
  let g:neocomplcache_auto_completion_start_length = 3
  let g:neocomplcache_force_overwrite_completefunc = 1
  let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate-snippets/snippets'

  " AutoComplPop like behavior.
  let g:neocomplcache_enable_auto_select = 0

  " SuperTab like snippets behavior.
  imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
  smap  <tab>  <right><plug>(neocomplcache_snippets_jump)

  " Plugin key-mappings.
  " Ctrl-k expands snippet & moves to next position
  " <CR> chooses highlighted value
  imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  smap <C-k>     <Plug>(neocomplcache_snippets_expand)
  inoremap <expr><C-g>   neocomplcache#undo_completion()
  inoremap <expr><C-l>   neocomplcache#complete_common_string()
  inoremap <expr><CR>    neocomplcache#complete_common_string()


  " <CR>: close popup
  " <s-CR>: close popup and save indent.
  inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
  inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
   let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


  " For snippet_complete marker.
  if has('conceal')
     set conceallevel=2 concealcursor=i
  endif


  " Indent Guides {
    let g:indent_guides_auto_colors = 1
    set ts=2 sw=2 et
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
  "}


  " UndoTree {
    nnoremap <Leader>u :UndotreeToggle<CR>
  " }"


  " NerdTree {
   map <C-e> :NERDTreeToggle<CR>
   map <leader>e :NERDTREEFind<CR>

   let NERDTreeShowBookmakrs=1
   let NERDTreeIgnore=['\.git', '\~$', '\.swp$', '\.hg']
   let NERDTreeChDirMode=0
   let NERDTreeQuitOnOpen=1
   let NERDTreeMouseMode=2
   let NERDTreeShowHidden=1
   let NERDTreeKeepTreeInNewTab=1
   let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

   let g:Powerline_symbols = 'fancy'

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" GUI Settings {
  "GVIM
  if has('gui_running')
    set guioptions-=T
    set lines=40
    if has('gui_gtk2')
      "set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 14
    else
      set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    endif
    if has('gui_macvim')
      set transparency=5
    endif
  else
    if &term == 'xterm' || &term == 'screen'
      set t_Co=256
    endif
  endif
" }
