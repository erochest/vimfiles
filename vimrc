
"{{{1 Set up Vundle (gmarik/vundle) and other plugins
set rtp+=~/.vim/vundle/
" call vundle#rc()

filetype off

if has('win32')
	set rtp+=~/vimfiles/bundle/vundle
else
	set rtp+=~/.vim/bundle/vundle/
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" I can see what to add back in by going here:
" https://github.com/erochest/vimfiles/commit/84bbc9af4dd977175bd4d05e501e60fdf38fd1e4

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'nvie/vim-flake8'
Bundle 'bling/vim-airline'
Bundle 'epeli/slimux'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'VimOutliner'
Bundle 'vimoutliner-colorscheme-fix'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-speeddating'
Bundle 'othree/html5.vim'
Bundle 'pbrisbin/html-template-syntax'

filetype plugin indent on
syntax on

"{{{1 Global settings

let mapleader=","

set backup
set backupskip=/tmp/*,/private/tmp/*
set hlsearch
set nojoinspaces
set modeline
set foldmethod=marker
set number
set relativenumber
set wildignore=*.swp,*.bak,*.pyc,*.ho,*.hi,*.o
set pastetoggle=<F2>
set cursorline
set wildmenu

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

nmap <leader><leader> <c-^>

" set grepprg=ack\ --column\ --nogroup\ --nopager
set grepprg=ag\ --column\ --stats\ --nogroup
set grepformat=%f:%l:%c:%m

nmap <Leader>fcw :copen<CR><C-w>k:grep <C-R>=expand("<cword>")<CR><CR>

set directory=~/.tmp,~/tmp,/tmp
set backupdir=~/.tmp,~/tmp,/tmp

"{{{2 ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|cabal-dev)$'

"{{{2 NERDTree
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

"{{{1 GUI Settings

if &t_Co > 2 || has("gui_running")
	set guioptions-=m
	set guioptions-=T
	if filereadable(expand("<sfile>:p:h") . "/.vimcolor")
		source <sfile>:p:h/.vimcolor
	endif
endif

if has("X11")
	set guifont=DejaVu\ Sans\ Mono\ 10
elseif has("win32")
	set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
elseif has("gui_running")
	" set guifont=Bitstream\ Vera\ Sans\ Mono:h13
	set guifont=Source\ Code\ Pro:h14
	" set guifont=Ubuntu\ Mono:h16
	set transparency=10
endif

"{{{1 Mappings

vmap Q gq
nmap Q gqap
nmap <silent> ,/ :nohlsearch<CR>
nmap <silent> ,S :set nospell<CR>

nnoremap <M-Right> <C-W><Right>
nnoremap <M-Left> <C-W><Left>
nnoremap <M-Up> <C-W><Up>
nnoremap <M-Down> <C-W><Down>

nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>V :let spr=&spr<BAR>set nospr<BAR>vnew<BAR>let &spr=spr<CR>

nmap <C-M-Up> <C-w>n
nmap <C-M-Down> <C-w>N
nmap <C-M-Right> <C-w>v
nmap <C-M-Left> <C-w>V

nmap <C-n> :next<CR>
nmap <C-j> :cn<CR>zvzz

nmap <F12> :set nospell<CR>

" This jumps to the current tag in a new window. If there's more than one
" target for that tag, prompt for which to go to. This uses the "t register.
nmap <c-w><c-]> "tyaw:stjump<space><c-r>t<cr>

nmap <localleader>cx :s/\[ \] /[x] <c-r>=strftime("%Y-%m-%d %H:%M")<cr> /<cr>:nohlsearch<cr>
nmap <localleader>ct /\[TODAY]<cr>
nmap <localleader>cT :s/\[ \] /&[TODAY] /<cr>
nmap <localleader>ca /\[ACTIVE]<cr>
nmap <localleader>cA :s/\[ \] /&[ACTIVE] /<cr>

"{{{2 Mappings for :Tab
vmap t= :Tab /=<CR>
vmap t> :Tab /[=-]><CR>
vmap t: :Tab /:<CR>

"{{{1 Commands & Mappings

function s:ChCwd()
	execute "chdir " . escape(expand("%:p:h"), ' ')
endfunction
com! ChCwd call s:ChCwd()

function s:StripWS()
	%s/\s\+$//ge
endfunction
com! StripWS call s:StripWS()

function! s:TodoListMode()
	e ~/gtd/todo.txt
	Calendar
	wincmd l
	tabnew ~/gtd/journal.mkd
	tabfirst
	" or 'norm! zMzr
endfunction!
com! TodoList call s:TodoListMode()

function! s:GtdMode()
	tabonly
	e ~/Dropbox/gtd/inbox.txt
	tabe ~/Dropbox/gtd/outline.otl
	sp
	tabe ~/tmp/scratch.md
	tabnext 1
endfunction
com! Gtd call s:GtdMode()

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! Browser()
	let line = getline(".")
	exec "!open '" . substitute(line, '^\s*', '', '') . "'"
endfunction
map <LocalLeader>http :call Browser()<CR>

function! s:ExpandWindow()
	set lines=56 columns=120
endfunction
com! ExpandWindow call s:ExpandWindow()

function! ShowRunOff()
	highlight RunOff term=bold ctermbg=darkgrey guibg=#592929
	call matchadd("RunOff", "\\%" . &textwidth . "v.*")
endfunction
nmap <leader>R :call ShowRunOff()<cr>

function! ShowRunOff78()
	highlight RunOff term=bold ctermbg=darkgrey guibg=#592929
	call matchadd("RunOff", "\\%78v.*")
endfunction
nmap <leader>R8 :call ShowRunOff78()<cr>

function! ShiftWin()
	" For automatically resizing windows when you navigate.
	set winheight=5
	set winminheight=5
	set winheight=999
	nmap <c-w>j <c-w>j<c-w>_
	nmap <c-w>k <c-w>k<c-w>_
endfunction

nmap <Leader>j ggO# Date: <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><CR>
nmap <Leader>J <Leader>j<CR><ESC>k:r!~/bin/todo.sh archive<CR>{zz
nmap <Leader>archive :r!todo.sh archive<CR>
nmap <Leader>pl o<ESC>"+p
nmap <Leader>dl "+dd
nmap <Leader>yy "+yy
nmap <Leader>l ggO<C-R>=strftime("%m-%d-%YT%H:%M:%S %z")<CR><space>\|<space>

imap <Leader>d <C-R>=strftime("%Y-%m-%dT%H:%M:%S %z")<CR>
nmap <Leader>d i<Leader>d

"{{{2
vmap <Leader>x :SlimuxREPLSendSelection<CR>
nmap <Leader>x :SlimuxREPLSendLine<CR>
nmap <Leader>tmux :SlimuxREPLConfigure<CR>

vmap <Leader>tsh :SlimuxShellPrompt<CR>
nmap <Leader>ts! :SlimuxShellLast<CR>
nmap <Leader>retsh :SlimuxShellConfigure<CR>

