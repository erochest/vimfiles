
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal smarttab
setlocal textwidth=0
setlocal foldmethod=indent
setlocal foldcolumn=1

" setlocal omnifunc=necoghc#omnifunc
" let g:syntastic_haskell_checkers = []
let g:ycm_semantic_triggers = {'haskell': ['.']}

nmap <buffer> <localleader>x :wa<cr>:SlimuxShellRun stack clean<cr>
nmap <buffer> <localleader>b :wa<cr>:SlimuxShellRun stack build<cr>
nmap <buffer> <localleader>t :wa<cr>:SlimuxShellRun stack test<cr>
nmap <buffer> <localleader>s :w<cr>:%!stylish-haskell<cr>

nmap <buffer> <localleader>C :wa<cr>:SlimuxShellRun make configure<cr>
nmap <buffer> <localleader>B :wa<cr>:SlimuxShellRun make build<cr>
nmap <buffer> <localleader>T :wa<cr>:SlimuxShellRun make test<cr>
nmap <buffer> <localleader>R :wa<cr>:SlimuxShellRun make run<cr>

nmap <buffer> <localleader>L :wa<cr>:SlimuxShellRun :reload<cr>

nmap <buffer> <localleader>ht :GhcModType<cr>
nmap <buffer> <localleader>hC :GhcModTypeClear<cr>
nmap <buffer> <localleader>hi :GhcModTypeInsert<cr>
nmap <buffer> <localleader>hl :GhcModLint<cr>
nmap <buffer> <localleader>hc :GhcModCheck<cr>

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" nmap <buffer> <localleader>ht :HdevtoolsType<cr>
" nmap <buffer> <localleader>hc :HdevtoolsClear<cr>
" nmap <buffer> <localleader>hi :HdevtoolsInfo<cr>

vmap <buffer> <localleader>in :!hindent --style johan-tibell<cr>

setlocal conceallevel=0
" compiler stack

" let g:haddock_browser="open"
" let g:haddock_browser_callformat = "%s %s"
"let g:haskell_autotags = 1
"let g:haskell_tags_generator = 'hasktags'

"let g:haskell_multiline_strings = 1

set tags=tags;/,codex.tags;/

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

