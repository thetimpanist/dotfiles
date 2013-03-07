echo "(>^.^<)"

" set numbering
set nu
set numberwidth=4

" lower right hand cursor position
set ruler

" ignore case on search
set ic

" search highlighting
set hlsearch
set incsearch



" tabs and indenting
set expandtab
set tabstop=4
set sw=4
set autoindent
set smartindent
set shiftround

" set to auto read when a file is changed from the outside
set autoread

" set cursor 7 lines from the edges when vertical scrolling
set so=7

" turn line wrapping off
set nowrap

" set wild menu for command line completion
set wildmenu

" colors
colorscheme railscasts

" map leader key
let mapleader = "-"
let maplocalleader = "-"

" tab around
nnoremap <leader><tab> 4i<space><esc>l
nnoremap <leader><S-tab> 4i<backspace><esc>l

" insert a space
nnoremap <space> i<space><esc>l

" uppercase previous word
inoremap <c-u> <esc>vbUea<space>

" auto curly brace
inoremap {{ {<enter>}<esc><s-o>

" assoc array brackets
inoremap [[ ['
inoremap ]] ']

" edit vimrc in buffer
:nnoremap <leader>erc :split $MYVIMRC<cr>

" source vimrc
:nnoremap <leader>src :so $MYVIMRC<cr>

" check php syntax
:nnoremap <leader>cs :! php -l %<enter>

