
"{{{ Set up Vundle (gmarik/vundle) and other plugins
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

Bundle 'gmarik/vundle'

Bundle 'sukima/xmledit'
" Bundle 'bdd/vim-scala'
" Bundle 'ewiplayer/vim-scala'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-abolish'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-ragtag'
Bundle 'othree/html5.vim'
Bundle 'mrtazz/simplenote.vim'
" Bundle 'afternoon/vim-phpunit'
Bundle 'phpcomplete.vim'
Bundle 'rstacruz/sparkup'
Bundle 'Gundo'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'VimClojure'
Bundle 'jnwhiteh/vim-golang'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-cucumber'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'pangloss/vim-javascript'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'vim-scripts/Color-Sampler-Pack'
Bundle 'tpope/vim-rake'
Bundle 'majutsushi/tagbar'
Bundle 'matthias-guenther/hammer.vim'
Bundle "dag/vim2hs"
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/neosnippet'
" Add back in:
Bundle 'VimOutliner'
Bundle 'vimoutliner-colorscheme-fix'
Bundle 'taglist.vim'
Bundle 'project.tar.gz'
Bundle 'sparql.vim'
Bundle 'n3.vim'
Bundle 'Processing'
Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'juvenn/mustache.vim'
Bundle 'pbrisbin/html-template-syntax'
" Bundle 'jgdavey/tslime.vim'
Bundle 'walm/jshint.vim'
Bundle 'clvv/a.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'tpope/vim-git'
Bundle 'scrooloose/syntastic'
Bundle 'rodjek/vim-puppet'
" Bundle 'vim-pandoc/vim-pandoc'
" Bundle "kana/vim-textobj-indent"
Bundle 'editorconfig/editorconfig-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'WebAPI.vim'
Bundle 'jceb/vim-orgmode'
Bundle 'tpope/vim-speeddating'
Bundle 'VOoM'
" Bundle 'FredKSchott/CoVim'
Bundle 'epeli/slimux'
Bundle 'wting/rust.vim'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-sensible'
Bundle 'blackdust.vim'
Bundle 'nelstrom/vim-markdown-folding'

" {{{ Haskell stuff
" Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'feuerbach/vim-hs-module-name'
" Bundle 'Twinside/vim-haskellConceal'
Bundle 'haskellFold'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'bitc/lushtags'
Bundle 'bitc/vim-hdevtools'
" }}}

" Both of these are broken, so I've added it manually.
" Bundle 'Conque-Shell'
" Bundle 'http://conque.googlecode.com/files/conque_2.3.tar.gz'
" Bundle 'conque'

" {{{ Still AWOL:
"  * todotxt
"  * dbext
" }}}
 
filetype plugin indent on
syntax on
"}}}

"{{{ Global settings

let mapleader=","

" set autoindent
" set backspace=indent,eol,start
set backup
" for editing crontab files
set backupskip=/tmp/*,/private/tmp/*
" set history=50
" set ruler
set hlsearch
" set incsearch
set nojoinspaces
" set wildmenu
set modeline
set foldmethod=marker
set number
set relativenumber
set wildignore=*.swp,*.bak,*.pyc,*.ho,*.hi,*.o
set pastetoggle=<F2>
set cursorline

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

nmap <leader><leader> <c-^>

let g:snips_author='Eric Rochester'

" Trying out ag
set grepprg=ack\ --column\ --nogroup\ --nopager
" set grepprg=ag\ --column\ --stats
" set grepformat=%f:%l:%c:%m

" From http://stolowski.blogspot.com/2011/07/finding-your-way-in-vim.html
nmap <Leader>fcw :copen<CR><C-w>k:grep <C-R>=expand("<cword>")<CR><CR>

set directory=~/.tmp,~/tmp,/tmp
set backupdir=~/.tmp,~/tmp,/tmp

" set formatprg=par\ -w60
" map <A-q> {v}!par -jw60<CR>
" vmap <A-q> !par -jw60<CR>

" These are for NERDCommenter:
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

"{{{ For neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
    " \ 'default' : '',
    " \ 'vimshell' : $HOME.'/.vimshell_hist',
    " \ 'scheme' : $HOME.'/.gosh_completions'
    " \ }

" Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
  " let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" imap <C-o>     <Plug>(neocomplcache_snippets_expand)
" smap <C-o>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"}}}

"{{{ ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|cabal-dev)$'
"}}}

" {{{ ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" let vimclojure#WantNailgun = 1

"}}}

"{{{ GUI Settings

" syntax and automatically load ~/.vimcolor
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

"}}}

"{{{ Mappings

" From http://nvie.com/posts/how-i-boosted-my-vim/
" nnoremap ; :			" Actually, I'd like to use the ; command.
vmap Q gq
nmap Q gqap
nmap <silent> ,/ :nohlsearch<CR>
nmap <silent> ,S :set nospell<CR>

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

" Turn off spell-check. This makes HTML and other things hard to read.
nmap <F12> :set nospell<CR>

" This jumps to the current tag in a new window. If there's more than one
" target for that tag, prompt for which to go to. This uses the "t register.
nmap <c-w><c-]> "tyaw:stjump<space><c-r>t<cr>

"{{{ Mappings for :Tab
vmap t= :Tab /=<CR>
vmap t> :Tab /[=-]><CR>
vmap t: :Tab /:<CR>
"}}}

"}}}

"{{{ File-type Settings
if filereadable(expand("<sfile>:p:h") . "/.simplenoterc")
	source <sfile>:p:h/.simplenoterc
endif

let g:hdevtools_options = '"-g-package-db .cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d/"'
let g:haddock_browser   = 'open'
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
	e ~/Dropbox/gtd/someday.txt
	set filetype=todotxt
	sp ~/Dropbox/gtd/gtd.otl
	sp ~/Dropbox/gtd/todo.txt
	set filetype=todotxt
	tabe ~/Dropbox/links.txt
	sp ~/Dropbox/gtd/inbox.txt
	normal G
	tabe ~/Dropbox/quotes
	tabe ~/Dropbox/journal.mkd
	sp ~/Dropbox/melina.mkd
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

" From http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
function! Browser()
	let line = getline(".")
	exec "!open '" . substitute(line, '^\s*', '', '') . "'"
endfunction
map <LocalLeader>http :call Browser()<CR>

" Expand to a larger window size.
function! s:ExpandWindow()
	set lines=56 columns=120
endfunction
com! ExpandWindow call s:ExpandWindow()

" This sets the text that runs past textwidth to be a different color.
function! ShowRunOff()
	highlight RunOff term=bold ctermbg=darkgrey guibg=#592929
	call matchadd("RunOff", "\\%" . &textwidth . "v.*")
endfunction
nmap <leader>R :call ShowRunOff()<cr>

" This sets the text that runs past the 78th column.
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

" This creates a nmap that sends the current file name to a program running in
" tmux.
" function! s:CreateNMapTmuxFile(mapChar, programFormat)
" 	let mapping = printf("nmap <LocalLeader>%s :w<cr>:call Send_to_Tmux(printf(\"%s\", bufname(\"\%\")) . \"\\n\")<cr>", a:mapChar, escape(a:programFormat, "\""))
" 	" echo mapping
" 	exec mapping
" endfunction
" command! -nargs=* TMuxFile call s:CreateNMapTmuxFile(<f-args>)

nmap <Leader>j ggO# Date: <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><CR>
nmap <Leader>J <Leader>j<CR><ESC>k:r!~/bin/todo.sh archive<CR>{zz
nmap <Leader>archive :r!todo.sh archive<CR>
nmap <Leader>pl o<ESC>"+p
nmap <Leader>dl "+dd
nmap <Leader>yy "+yy
nmap <Leader>l ggO<C-R>=strftime("%m-%d-%YT%H:%M:%S %z")<CR><space>\|<space>

imap <Leader>d <C-R>=strftime("%Y-%m-%dT%H:%M:%S %z")<CR>
nmap <Leader>d i<Leader>d

" For TMux
vmap <Leader>x :SlimuxREPLSendSelection<CR>
nmap <Leader>x :SlimuxREPLSendLine<CR>
nmap <Leader>tmux :SlimuxREPLConfigure<CR>

vmap <Leader>tsh :SlimuxShellPrompt<CR>
nmap <Leader>ts! :SlimuxShellLast<CR>
nmap <Leader>retsh :SlimuxShellConfigure<CR>

"}}}

