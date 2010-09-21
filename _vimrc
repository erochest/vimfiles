
"{{{ Global settings

set autoindent
set backspace=indent,eol,start
set backup
set history=50
set ruler
set hlsearch
set incsearch
set wildmenu
set modeline
set foldmethod=marker
set number
set hidden
set wildignore=*.swp,*.bak,*.pyc

filetype indent plugin on

set grepprg=ack\ --column\ --nogroup\ --nopager
set grepformat=%f:%l:%c:%m

"}}}

"{{{ Set up Pathogen (git://github.com/tpope/vim-pathogen.git).
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
"}}}

"{{{ GUI Settings

" syntax and automatically load ~/.vimcolor
if &t_Co > 2 || has("gui_running")
	syntax on
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
endif

"}}}

"{{{ Mappings
" The next four blocks are taken from
" http://stackoverflow.com/questions/1445992/vim-file-navigation/1446480#1446480

" Window movements; I do this often enough to warrant using up M-arrows on this"
nnoremap <M-Right> <C-W><Right>
nnoremap <M-Left> <C-W><Left>
nnoremap <M-Up> <C-W><Up>
nnoremap <M-Down> <C-W><Down>

" Open window below instead of above"
nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Vertical equivalent of C-w-n and C-w-N"
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>V :let spr=&spr<BAR>set nospr<BAR>vnew<BAR>let &spr=spr<CR>

" I open new windows to warrant using up C-M-arrows on this"
nmap <C-M-Up> <C-w>n
nmap <C-M-Down> <C-w>N
nmap <C-M-Right> <C-w>v
nmap <C-M-Left> <C-w>V

" More movements
"nmap <C-Tab> :tabnext<CR>	" Removed after I discovered gt and gT
nmap <C-n> :next<CR>
nmap <C-j> :cn<CR>zvzz

"}}}

"{{{ File-type Settings
" These should probably be moved to ftplugin/haskell_local.vim
" Haskell mode settings. From http://projects.haskell.org/haskellmode-vim/
au Bufenter *.hs compiler ghc
let g:haddock_browser = "C:/Program Files/Mozilla Firefox/firefox.exe"

let vimclojure#WantNailgun = 1

"}}}

"{{{ Commands & Mappings

" Some of these are taken from http://stackoverflow.com/questions/164847/what-is-in-your-vimrc/171558#171558

function s:ChCwd()
	execute "chdir " . escape(expand("%:p:h"), ' ')
endfunction
com! ChCwd call s:ChCwd()

function s:StripWS()
	%s/\s\+$//ge
endfunction
com! StripWS call s:StripWS()

function! s:TodoListMode()
	e ~/.todo.otl
	Calendar
	wincmd l
	set foldlevel=1
	tabnew ~/.notes.txt
	tabfirst
	" or 'norm! zMzr
endfunction!
com! TodoList call s:TodoListMode()

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" From http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
function! Browser()
	let line = getline(".")
	exec "!google-chrome '" . line . "'"
endfunction
map <LocalLeader>http :call Browser()<CR>

nmap <Leader>j ggODate: <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><CR>Subject: <CR>Tags: <CR><CR><CR><CR>=====<CR><ESC>kkkkkk$
nmap <Leader>pl o<ESC>"+p
nmap <Leader>dl "+dd

"}}}

