if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

if has('nvim')
    Plug 'ThePrimeagen/vim-be-good'
endif

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-unimpaired'
    Plug 'easymotion/vim-easymotion'
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'
    Plug 'machakann/vim-highlightedyank'
    Plug 'jiangmiao/auto-pairs'
    Plug 'psliwka/vim-smoothie'
    Plug 'nikvdp/neomux'
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'ActivityWatch/aw-watcher-vim'
    Plug 'metakirby5/codi.vim'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'vim-python/python-syntax'
    Plug 'psf/black'
    Plug 'python-rope/ropevim'
    Plug 'CoatiSoftware/vim-sourcetrail'
    Plug 'sheerun/vim-polyglot'
    Plug 'gcmt/taboo.vim'

