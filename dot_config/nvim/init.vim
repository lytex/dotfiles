if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif


if has('nvim')
    runtime firenvim.vim
    Plug 'ThePrimeagen/vim-be-good'
endif

let mapleader = " "

" Surround an object with a character
Plug 'tpope/vim-surround'

" Comments with gc
Plug 'tpope/vim-commentary'

" Highlight possible motions
Plug 'easymotion/vim-easymotion'
map gs <Plug>(easymotion-prefix)

" s__ jump to 2 characters
" Example: dz12, dx12, | signals the cursor position
"
"      z →  12   |ah123 → 23
"    ↗
" d
"    ↘
"      x →  12   |ah123 → 123

Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
let g:sneak#use_ic_scs = 1 " Use same confing as ignorecase/smartcase
" jump with ; , after f,t across lines
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

onoremap <silent> z :<c-u>call sneak#wrap(v:operator,   2, 0, 3, 1)<cr>
onoremap <silent> x :<c-u>call sneak#wrap(v:operator,   2, 0, 0, 1)<cr>
onoremap <silent> Z :<c-u>call sneak#wrap(v:operator,   2, 1, 3, 1)<cr>
onoremap <silent> X :<c-u>call sneak#wrap(v:operator,   2, 1, 0, 1)<cr>

" Highlight possible f,t jumps
Plug 'unblevable/quick-scope'

Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 100

Plug 'jiangmiao/auto-pairs'

" Smooth C-D,U,B,F movements
Plug 'psliwka/vim-smoothie'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Go to parent directories until there is an .git directory
Plug 'airblade/vim-rooter'


if has('nvim')
    Plug 'sudormrfbin/cheatsheet.nvim'
    " Dependencies of cheatsheet.nvim
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    map <c-h>c :lua require('telescope.builtin').help_tags()<cr>
endif


if has('nvim')
    " Terminal integration in neovim
    Plug 'nikvdp/neomux'
    let g:neomux_default_shell = "zsh"
endif


runtime tabs.vim

runtime lang.vim
runtime jumphl.vim
DoJumpHl 

runtime yinote.vim

Plug 'patstockwell/vim-monokai-tasty'

Plug 'ActivityWatch/aw-watcher-vim'

call plug#end()

set nocompatible " No compatibility with vi

" Remap escape
inoremap jk <Esc>

syntax enable " enable syntax processing
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" Bidirectional integration with system clipboard
set clipboard=unnamedplus
:vnoremap y "+y
set mouse=a " Use mouse

set ignorecase " ignore case when searching
set smartcase " match case when there is an upercase letter

if has('nvim')
    " escape disables highlighting of current match
    map <silent> <esc> :nohl <cr>
else
    nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
    set hlsearch
endif


if has('nvim')
    set inccommand=nosplit " Live preview of replaced text
endif

set undofile " Maintain undo history between sessions

" Y goes to the end of line
map Y y$
" Center vim after jumping to next/prev result
nnoremap n nzzzv
nnoremap N Nzzzv
" Keep the cursor in place when joining lines
nnoremap J mzJ`z

" Set undo break points (<c-g>u) when typing one of those characters:
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap : :<c-g>u
inoremap ] ]<c-g>u
inoremap } }<c-g>u
inoremap ) )<c-g>u
inoremap <cr> <cr><c-g>u

" Save jumplist for jumps greater than 5
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Swap text without copying it (ddp, xp, ...)
" Since we use the system register, the unnamed register is fine to store it
vnoremap H ""x2h""p
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap L ""x""p

nnoremap <leader>h ""x2h""p
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==
nnoremap <leader>l ""x""p

inoremap <c-h> <esc>h ""x2h""pa
inoremap <c-k> <esc>:m .-2<cr>==a
inoremap <c-j> <esc>:m .+1<cr>==a
inoremap <c-l> <esc> ""x""pa:set


set number relativenumber " Hybrid numbers

set shell=zsh
if has('nvim')
    autocmd TermOpen * setlocal nonumber norelativenumber mouse=a " Disable relative number in terminal and mouse support
endif

" Tabs
" https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces per level of indentation
set expandtab " expand tabs into spaces
set smartindent " insert indent automatically on new line

" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype sql setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

