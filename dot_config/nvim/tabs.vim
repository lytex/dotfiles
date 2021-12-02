
let g:taboo_tab_format = "%n:%f%m"
Plug 'gcmt/taboo.vim'
set sessionoptions+=tabpages,globals

nnoremap <leader><tab>1 1gt
nnoremap <leader><tab>2 2gt
nnoremap <leader><tab>3 3gt
nnoremap <leader><tab>4 4gt
nnoremap <leader><tab>5 5gt
nnoremap <leader><tab>6 6gt
nnoremap <leader><tab>7 7gt
nnoremap <leader><tab>8 8gt
nnoremap <leader><tab>9 9gt
nnoremap <leader><tab>0 0gt

nnoremap <silent> <leader><tab>n :tabe<CR>
nnoremap <silent> <leader><tab>d :tabclose<CR>
nnoremap          <leader><tab>N :TabooOpen<Space>
nnoremap          <leader><tab>r :TabooRename<Space>
nnoremap          <leader><tab>] :tabnext<CR>
nnoremap          <leader><tab>[ :tabprevious<CR>


nnoremap <Leader>w <C-w>
nnoremap <Leader>wd <C-w>q
nnoremap <silent> <leader>qq :q<CR>

