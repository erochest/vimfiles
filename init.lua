
-- Nothing to see here. Move along, citizen.

vim.opt.backup = true
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.backspace = { indent = true, eol = true, start=true }
vim.opt.hlsearch = true
vim.opt.joinspaces = false
vim.opt.modeline = true
vim.opt.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore= { "*.swp", "*.bak", "*.pyc", "*.ho", "*.hi", "*.o"}
-- vim.opt.pastetoggle=<F2>
vim.opt.cursorline = true
vim.opt.wildmenu = true

vim.g.mapleader = " "

-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
vim.keymap.set("v", "Q", "gq",   { desc = "Reformat the selection." })
vim.keymap.set("n", "Q", "gqap", { desc = "Reformat the current paragraph." })
vim.keymap.set("n", "<leader>/", function()
	vim.opt.hlsearch = false
end, {
	desc = "Turn off search highlighting.",
	silent = true
})
vim.keymap.set("n", "<leader>S", function()
	vim.opt.spell = false
end, {
	desc = "Turn off spell checking.",
	silent = true
})

vim.keymap.set("n", "<C-n>", ":next<CR>", { desc = "Move to the next file in args." })

-- vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})

vim.api.nvim_create_user_command('ChCwd', 'chdir %:p:h', {
	nargs = 0,
	bang = false,
})

vim.api.nvim_create_user_command('StripWS', '%s/\\s\\+$//ge', {
	nargs = 0,
	bang = false,
})

vim.api.nvim_create_user_command('DiffWithSaved', function()
	filetype = vim.bo.filetype

	vim.api.nvim_command('diffthis')

	vim.api.nvim_command('vnew')
	vim.api.nvim_command('r #')
	vim.api.nvim_command('normal! 1Gdd')

	vim.api.nvim_command('diffthis')

	vim.opt_local.buftype = 'nofile'
	vim.opt_local.bufhidden = 'wipe'
	vim.opt_local.buflisted = false
	vim.opt_local.swapfile = false
	vim.opt_local.readonly = true
	vim.opt_local.filetype = filetype
end, {
	nargs = 0,
	bang = false,
})

-- function! Browser()
-- 	let line = getline(".")
-- 	exec "!open '" . substitute(line, '^\s*', '', '') . "'"
-- endfunction
-- map <LocalLeader>http :call Browser()<CR>
--
-- function! s:ExpandWindow()
-- 	" set lines=56 columns=120
-- 	set lines=46 columns=90
-- endfunction
-- com! ExpandWindow call s:ExpandWindow()
--
-- function! s:List100()
-- 	mark l
-- 	put =range(1, 100)
-- 	'l,.s/^\d\+$/&.	/
-- endfunction
-- com! List100 call s:List100()
--
-- function! ShowRunOff()
-- 	highlight RunOff term=bold ctermbg=darkgrey guibg=#592929
-- 	call matchadd("RunOff", "\\%" . &textwidth . "v.*")
-- endfunction
-- nmap <leader>R :call ShowRunOff()<cr>
--
-- function! ShowRunOff78()
-- 	highlight RunOff term=bold ctermbg=darkgrey guibg=#592929
-- 	call matchadd("RunOff", "\\%78v.*")
-- endfunction
-- nmap <leader>R8 :call ShowRunOff78()<cr>
--
-- function! ShiftWin()
-- 	" For automatically resizing windows when you navigate.
-- 	set winheight=5
-- 	set winminheight=5
-- 	set winheight=999
-- 	nmap <c-w>j <c-w>j<c-w>_
-- 	nmap <c-w>k <c-w>k<c-w>_
-- endfunction
--
-- " From https://gist.github.com/lmullen/426094d4cac517bbb292:
-- "
-- " Add all flags in the style {TODO: description} or {PAGE} in current document
-- " to quickfix list
-- function! ListTodo()
-- 	vimgrep /\v\{[A-Z]+(:\_.{-})?\}/gj %
-- 	copen
-- endfunction
--
-- " Do the same for all Markdown documents in this directory and subdirectories
-- function! ListTodoR()
-- 	vimgrep /\v\{[A-Z]+(:\_.{-})?\}/gj ./**/*.md
-- 	copen
-- endfunction
--
-- " From http://www.kornerstoane.com/2014/06/why-i-cant-stop-using-vim/
-- " Search for any .vimsettings files in the path to the file.
-- " Source them if you find them.
-- function! ApplyLocalSettings(dirname)
--     " Don't try to walk a remote directory tree -- takes too long, too many
--     " what if's
--     let l:netrwProtocol = strpart(a:dirname, 0, stridx(a:dirname, "://"))
--     if l:netrwProtocol != ""
--         return
--     endif
--
--     " Convert windows paths to unix style (they still work)
--     let l:curDir = substitute(a:dirname, "", "/", "g")
--     let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, "/"))
--     if isdirectory(l:parentDir)
--         call ApplyLocalSettings(l:parentDir)
--     endif
--
--     " Now walk back up the path and source .vimsettings as you find them. This
--     " way child directories can 'inherit' from their parents
--     let l:settingsFile = a:dirname . "/.vimsettings"
--     if filereadable(l:settingsFile)
--         exec ":source " . l:settingsFile
--     endif
-- endfunction
-- autocmd! BufEnter * call ApplyLocalSettings(expand("<afile>:p:h"))
--
