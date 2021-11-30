let g:python_highlight_all = 1


filetype plugin on
let g:black_linelength = 120
autocmd BufWritePre *.py Black
autocmd BufWritePre *.json Black
autocmd BufWritePre *.geojson Black
