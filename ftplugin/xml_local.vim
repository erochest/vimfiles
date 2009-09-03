
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal textwidth=0
setlocal autoindent
setlocal backspace=indent,eol,start
setlocal foldmethod=indent
setlocal foldcolumn=1

" standard entities
imap <buffer> <LocalLeader>& &amp;
imap <buffer> <LocalLeader>< &lt;
imap <buffer> <LocalLeader>> &gt;
" mdash
imap <buffer> <LocalLeader>+ —
" ndash
imap <buffer> <LocalLeader>- –
" apostrophe
imap <buffer> <LocalLeader>' ’
" back apostrophe
imap <buffer> <LocalLeader>` ‘
" right double quote
imap <buffer> <LocalLeader>" ”
" left double quote
imap <buffer> <LocalLeader>~ “

if has("spell")
	setlocal spell spelllang=en
endif

