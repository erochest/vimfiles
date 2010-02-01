
" Vim Compiler File
" Compiler:	MSBuild
" Maintainer:	Eric Rochester <eric@ericrochester.com>
" Last Change:	1/27/2010
"

if exists("current_compiler") && current_compiler == "msbuild"
  finish
endif
let current_compiler = "msbuild"
setlocal makeprg=msbuild\ /nologo\ /v:q
setlocal errorformat=\ %#%f(%L\\\,%c):\ %m

