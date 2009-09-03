
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal textwidth=0
setlocal cindent
setlocal foldmethod=syntax
setlocal foldcolumn=1

compiler cs
setlocal makeprg=nant\ -e\ -nologo
setlocal errorformat=%f(%l\\,%c):\ %t%*[^\ ]\ CS%n:\ %m

