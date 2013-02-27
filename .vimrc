echo "(>^.^<)"

" set numbering
set rnu
set numberwidth=4

" lower right hand cursor position

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
inoremap <c-u> <esc>v`[U1wi

" auto curly brace
inoremap { {<enter>}<esc><s-o>

" assoc array brackets
inoremap [[ ['
inoremap ]] ']
