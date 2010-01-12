
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal textwidth=0
setlocal foldcolumn=1
setlocal foldmethod=indent
" setlocal omnifunc=pysmell#Complete
setlocal omnifunc=pythoncomplete#Complete

" hooks into the skel system
function! PySkelS()
	0r ~/vimfiles/skel/script.py
endfunction

function! PySkelM()
	0r ~/vimfiles/skel/module.py
endfunction

function! PySkelSetup()
	0r ~/vimfiles/skel/setup.py
endfunction

