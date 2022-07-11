vim.cmd([[
try
 if system("/usr/bin/plasma-apply-desktoptheme --list-themes | grep current | grep light || true") == ""
    colorscheme vim-monokai-tasty
  else
    colorscheme solarized
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
