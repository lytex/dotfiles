let mapleader = " "

map gs <Plug>(easymotion-prefix)

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

let g:highlightedyank_highlight_duration = 100

let g:neomux_default_shell = "zsh"
let g:neomux_exit_term_mode_map = "<C-M-s>" 
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
" C-u means erase selection like '<,'>:
nnoremap <silent> ZC :<C-u>w<CR>:<C-u>Bd<CR>
nnoremap <silent> ZB :<C-u>Bd!<CR>
" ZZ doesn't work when editing a patch, use ZX in these cases
nmap <silent> ZX ZC<C-w>qa
nnoremap <silent> ZM :<C-u>:q!<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

runtime tabs.vim

runtime jumphl.vim
DoJumpHl 


set nocompatible " No compatibility with vi

set lazyredraw " No fancy redraw stuff, :set lz if you want to enable it

" Remap escape
inoremap jk <Esc>

filetype plugin on
syntax enable " enable syntax processing

" Bidirectional integration with system clipboard
set clipboard=unnamedplus
:vnoremap y "+y
set mouse=a " Use mouse

set colorcolumn=80,120
try
 if system("/usr/bin/plasma-apply-desktoptheme --list-themes | grep current | grep dark || true") == ""
    highlight ColorColumn ctermbg=7 guibg=lightgrey
  else
    colorscheme vim-monokai-tasty
    highlight ColorColumn ctermbg=0 guibg=black
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  set background=dark
endtry

set ignorecase " ignore case when searching
set smartcase " match case when there is an upercase letter

if has('nvim')
    " escape disables highlighting of current match
    " Somehow this breaks regular vim
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

set number relativenumber " Hybrid numbers

autocmd TermOpen * setlocal nonumber norelativenumber mouse=a " Disable relative number in terminal and mouse support

" Tabs
" https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces per level of indentation
set expandtab " expand tabs into spaces
" set smartindent " (conflicts with treesitter) insert indent automatically on new line

set title


let g:conflict_marker_enable_highlight = 1
" disable the default highlight group
let g:conflict_marker_highlight_group = ''
" disable keybindings
let g:conflict_marker_enable_mappings = 0

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

" from https://michurin.github.io/xterm256-color-picker/
highlight ConflictMarkerBegin ctermbg=34 
highlight ConflictMarkerOurs ctermbg=22  
highlight ConflictMarkerTheirs ctermbg=27 
highlight ConflictMarkerEnd ctermbg=39 
highlight ConflictMarkerCommonAncestorsHunk ctermbg=yellow
