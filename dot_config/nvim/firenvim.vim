Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

au BufEnter github.com_*.txt set filetype=markdown
au BufEnter console.cloud.google.com_bigquery*.txt set filetype=sql
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']
let fc['https://trello.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://outlook.office.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://app.slack.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://meet.google.com/'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://meet.jit.si'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://av.esic.edu'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://docs.google.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://localhost:.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['localhost:.*'] = { 'takeover': 'never', 'priority': 1 }
set guifont=FuraMono\ Nerd\ Font:h10
