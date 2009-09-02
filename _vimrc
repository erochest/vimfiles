
set autoindent
set backspace=2
set backup
set history=50
set ruler
set hlsearch
set incsearch
set wildmenu
set modeline

filetype indent plugin on

if has("X11")
	set guifont=DejaVu\ Sans\ Mono\ 10
elseif has("win32")
	set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
endif

