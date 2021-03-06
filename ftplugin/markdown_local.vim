
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal smarttab
setlocal textwidth=78
setlocal foldcolumn=1

setlocal foldmethod=indent

let g:markdown_fold_style = 'nested'

setlocal autoindent

setlocal fileformat=unix

setlocal formatoptions=tcroqn2
setlocal comments=n:>

if has("spell")
	setlocal spell spelllang=en
endif

