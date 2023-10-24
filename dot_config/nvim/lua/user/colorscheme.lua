vim.cmd([[
try
 if system("cat ~/.config/plasmarc | grep dark || true") == ""
    colorscheme solarized
  else
    colorscheme vim-monokai-tasty
    set termguicolors " Make vim-illuminate work
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
