set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-sensible'
Plugin 'airblade/vim-rooter'
call vundle#end()            " required
filetype plugin indent on    " required

" key bindings
let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']
let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" pathogen
execute pathogen#infect()

" tabs as 2 spaces instead of \t characters
set shiftwidth=2 " indenting with '>' to 2 spaces
set expandtab " on pressing tab, convert to two spaces

" highlight the active row
set cursorline

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]

" NERD tree options
map <C-l> :NERDTreeToggle<CR>

" Highlight currently open buffer in NERDTree
autocmd BufEnter * lcd %:p:h
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" fzf
set rtp+=~/.fzf

" easy-align mapping
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Use theme
set background=dark
colorscheme molokai
let g:molokai_original = 1

" Make Vim more useful
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" ignore
set wildignore+=**/node_modules

" jj jk
:imap jk <Esc>
:imap jj <Esc>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

