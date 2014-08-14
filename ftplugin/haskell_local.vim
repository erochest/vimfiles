
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal textwidth=0
setlocal foldcolumn=1

setlocal omnifunc=necoghc#omnifunc

nmap <buffer> <localleader>x :wa<cr>:SlimuxShellRun cabal clean<cr>
nmap <buffer> <localleader>c :wa<cr>:SlimuxShellRun cabal configure<cr>
nmap <buffer> <localleader>b :wa<cr>:SlimuxShellRun cabal build<cr>
nmap <buffer> <localleader>d :wa<cr>:SlimuxShellRun cabal install --only-dependencies --enable-tests<cr>
nmap <buffer> <localleader>t :wa<cr>:SlimuxShellRun cabal test --test-option=--color<cr>
nmap <buffer> <localleader>s :w<cr>:%!stylish-haskell<cr>

nmap <buffer> <localleader>ht :HdevtoolsType<cr>
nmap <buffer> <localleader>hc :HdevtoolsClear<cr>
nmap <buffer> <localleader>hi :HdevtoolsInfo<cr>

setlocal conceallevel=0
compiler cabal

" let g:haddock_browser="open"
" let g:haddock_browser_callformat = "%s %s"
let g:haskell_autotags = 1
let g:haskell_tags_generator = 'hasktags'

