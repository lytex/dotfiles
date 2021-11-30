Plug 'metakirby5/codi.vim'
Plug 'jeetsukumaran/vim-pythonsense'

" Indentation level text object
Plug 'michaeljsmith/vim-indent-object'

" Enable advanced syntax hl such as fstrings, self, @decorator
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1


filetype plugin on
let g:black_linelength = 120
Plug 'psf/black'
autocmd BufWritePre *.py Black
autocmd BufWritePre *.json Black
autocmd BufWritePre *.geojson Black
Plug 'python-rope/ropevim'

Plug 'jsfaint/gen_tags.vim'

" SourceTrail integration
Plug 'CoatiSoftware/vim-sourcetrail'

Plug 'sheerun/vim-polyglot'

