" Vim filetype detection file
" Language:	todo.txt (http://todotxt.com/)
" Maintainer:	David O'Callaghan <david.ocallaghan@cs.tcd.ie>
" URL:		
" Version:	2
" Last Change:  2010 Aug 23
"
" The above is largely a lie. I commented out the one line.
augroup todotxt
     "  au! BufRead,BufNewFile *.never.txt,todo.txt,*.done.txt,*.todo.txt,recur.txt,done.txt,done_*.txt,tasks.txt setfiletype todotxt

	" these are copied from the todo.txt plugin
	" https://gitlab.com/dbeniamine/todo.txt-vim/-/blob/master/ftdetect/todo.vim?ref_type=heads
	autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=todo
	autocmd BufNewFile,BufRead [Tt]odo-\d\\\{4\}-\d\\\{2\}-\d\\\{2\}.txt set filetype=todo
	autocmd BufNewFile,BufRead [Tt]odo-\d\\\{4\}-\d\\\{2\}.txt set filetype=todo
	autocmd BufNewFile,BufRead \d\\\{4\}-\d\\\{2\}-\d\\\{2\}-[Tt]odo.txt set filetype=todo
	autocmd BufNewFile,BufRead \d\\\{4\}-\d\\\{2\}-[Tt]odo.txt set filetype=todo
	autocmd BufNewFile,BufRead [Tt]oday.txt set filetype=todo
	autocmd BufNewFile,BufRead [Dd]one.txt set filetype=todo
	autocmd BufNewFile,BufRead [Dd]one-\d\\\{4\}-\d\\\{2\}-\d\\\{2\}.txt set filetype=todo
	autocmd BufNewFile,BufRead [Dd]one-\d\\\{4\}-\d\\\{2\}.txt set filetype=todo
	autocmd BufNewFile,BufRead \d\\\{4\}-\d\\\{2\}-\d\\\{2\}-[Dd]one.txt set filetype=todo
	autocmd BufNewFile,BufRead \d\\\{4\}-\d\\\{2\}-[Dd]one.txt set filetype=todo
	autocmd BufNewFile,BufRead [Dd]one-[Tt]oday.txt set filetype=todo
	autocmd BufNewFile,BufRead */.todo/*.txt set filetype=todo

	if exists("$TODO_DIR")
	    au BufNewFile,BufRead $TODO_DIR/*.txt set filetype=todo
	endif

	if exists("$TODO_FILE")
	    au BufNewFile,BufRead $TODO_FILE set filetype=todo
	endif

	if exists("$DONE_FILE")
	    au BufNewFile,BufRead $DONE_FILE set filetype=todo
	endif

augroup END
