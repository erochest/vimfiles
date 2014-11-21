
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
nmap <buffer> <localleader>r :wa<cr>:SlimuxShellRun cabal run<cr>
nmap <buffer> <localleader>s :w<cr>:%!stylish-haskell<cr>

nmap <buffer> <localleader>C :wa<cr>:SlimuxShellRun make configure<cr>
nmap <buffer> <localleader>D :wa<cr>:SlimuxShellRun make deps<cr>
nmap <buffer> <localleader>B :wa<cr>:SlimuxShellRun make build<cr>
nmap <buffer> <localleader>T :wa<cr>:SlimuxShellRun make test<cr>
nmap <buffer> <localleader>S :wa<cr>:SlimuxShellRun make specs<cr>
nmap <buffer> <localleader>R :wa<cr>:SlimuxShellRun make run<cr>

nmap <buffer> <localleader>L :wa<cr>:SlimuxShellRun :reload<cr>

nmap <buffer> <localleader>ht :HdevtoolsType<cr>
nmap <buffer> <localleader>hc :HdevtoolsClear<cr>
nmap <buffer> <localleader>hi :HdevtoolsInfo<cr>

vmap <buffer> <localleader>in :!hindent --style johan-tibell<cr>

setlocal conceallevel=0
compiler cabal

" let g:haddock_browser="open"
" let g:haddock_browser_callformat = "%s %s"
let g:haskell_autotags = 1
let g:haskell_tags_generator = 'hasktags'

let g:haskell_multiline_strings = 1

function! s:OpenHaddock()
	call inputsave()
	let package = input('Open haddocks for package: ')
	call inputrestore()
	execute ('!open-haddock open ' . package)
endfunction
com! HaddockOpen call s:OpenHaddock()

function! s:OpenModule()
	call inputsave()
	let module = input('Open haddocks for module: ')
	call inputrestore()
	execute ('!open-haddock module ' . module)
endfunction
com! ModuleOpen call s:OpenModule()

