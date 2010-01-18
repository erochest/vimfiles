
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=78
setlocal foldcolumn=1

imap <buffer> ,e \emph{}<Left>
imap <buffer> ,i \textit{}<Left>
imap <buffer> ,b \textbf{}<Left>
imap <buffer> ,s \textsc{}<Left>
imap <buffer> ,t \texttt{}<Left>

compiler tex
setlocal makeprg=pdflatex\ %

if has("spell")
	setlocal spell spelllang=en
endif

