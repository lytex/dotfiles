vim.cmd([[
try
 if system("/usr/bin/plasma-apply-desktoptheme --list-themes | grep current | grep dark || true") == ""
    colorscheme solarized
  else
    colorscheme vim-monokai-tasty
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
