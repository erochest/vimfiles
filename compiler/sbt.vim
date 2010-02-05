
" Vim Compiler File
" Compiler:	Scala Build Tool
" Maintainer:	Eric Rochester <eric@ericrochester.com>
" Last Change:	2/5/2010
"

if exists("current_compiler") && current_compiler == "sbt"
  finish
endif
let current_compiler = "sbt"
setlocal makeprg=sbt\ compile
setlocal efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
       \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
       \%-G%.%#

