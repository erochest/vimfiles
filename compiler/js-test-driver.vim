" Vim compiler file for JavaScript
" Compiler:	js-test-driver
" Maintainer:	Eric Rochester <erochest@gmail.com>
" Last Change:	May 24, 2010
" Version:	0.1

if exists("current_compiler")
  finish
endif
let current_compiler = 'jstestdriver'

" probably want to break this down into jar, port, and other options.
if !exists('g:jstestdriver_cmd')
  let g:jstestdriver_cmd="java -jar JsTestDriver-1.2.1.jar --captureConsole --port 4224"
endif

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" I have a feeling this isn't going to work....
CompilerSet makeprg=g:jstestdriver_cmd

" Need to see what this should be.
CompilerSet efm=

