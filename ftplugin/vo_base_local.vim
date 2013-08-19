
function! s:MarkDone()
	exec "s/\\(\\s\\+\\)\\[ \\] \\((.) \\)\\?/\\1[x " . strftime("%Y-%m-%d %H:%M") . "] /"
	nohlsearch
endfunction
com! MarkDone call s:MarkDone()
nmap <buffer> <LocalLeader>x :MarkDone<cr>

