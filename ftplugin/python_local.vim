
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal textwidth=0
setlocal foldcolumn=1
setlocal foldmethod=indent
" setlocal omnifunc=pysmell#Complete
setlocal omnifunc=pythoncomplete#Complete

compiler pylint
let g:pylint_onwrite = 0

" hooks into the skel system
function! s:PySkelS()
	0r ~/vimfiles/skel/script.py
endfunction
com! PySkelS call s:PySkelS()

function! s:PySkelM()
	0r ~/vimfiles/skel/module.py
endfunction
com! PySkelM call s:PySkelM()

function! s:PySkelSetup()
	0r ~/vimfiles/skel/setup.py
endfunction
com! PySkelSetup s:PySkelSetup

