" map leader key
let mapleader = "-"

" set numbering
set nu
set numberwidth=4

" ignore case on search
set ic

" tabs and indenting
set backspace=2 " make backspace work like most other programs
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set sw=2
set autoindent
set smartindent
set shiftround

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" set to auto read when a file is changed from the outside
set autoread

" set cursor 7 lines from the edges when vertical scrolling
set so=7

" turn line wrapping off
set nowrap

" show last command in bottom bar
set showcmd

" speed enhancements
set lazyredraw

" parenthesis matching
set showmatch

" width color column
highlight ColorColumn ctermbg=233
set colorcolumn=81

colorscheme molokai

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" auto curly brace
inoremap {{ {<enter>}<esc><s-o>
inoremap }} }}<esc>h%i{<esc>%a

" edit vimrc in buffer
:nnoremap <leader>erc :split $MYVIMRC<cr>
:nnoremap <leader>src :so $MYVIMRC<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" hop around splits more easily
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-L> <C-W>l
:nnoremap <C-H> <C-W>h

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" undo tree
:nnoremap <leader>u :GundoToggle<CR>

" buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
set hidden
:nnoremap <a-}> :bnext<CR>
:nnoremap <a-{> :bprevious<CR>
:nnoremap <leader>q :bp <BAR> bd #<CR>

" disable netrw in favor of nerdtree
let loaded_netrwPlugin = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
:nnoremap <C-n> :NERDTreeToggle<CR>

" ALE linting events
augroup ale
  autocmd!

  if g:has_async
    set updatetime=1000
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  endif
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" escape exits terminal mode
:tnoremap <Esc> <C-\><C-n>
