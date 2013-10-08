
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

