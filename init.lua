
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
	desc = 'Change the current directory to the directory for the current file.'
})

vim.api.nvim_create_user_command('StripWS', '%s/\\s\\+$//ge', {
	desc = 'Strip all trailing whitespace from the file.'
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
	desc = "Diff the current buffer with what's saved to disk."
})

vim.api.nvim_create_user_command('Browser', function()
	url = vim.fn.getline("."):gsub("^%s*(.-)%s*$", "%1")

	if vim.fn.has('macunix') == 1 then
		vim.print("open " .. url)
		os.execute("open " .. url)
	elseif vim.fn.has('win64') == 1 then
		vim.print("start " .. url)
		os.execute("start " .. url)
	end
end, {
	desc = 'Open the URL on the current line in the system browser.'
})
vim.keymap.set("n", "<leader>http", vim.cmd.Browser)

vim.api.nvim_create_user_command('List100', function(opts)
	count = opts.count
	pad_to = #tostring(count)
	format = '%' .. pad_to .. 'd. '

	buffer = {}
	for i = 1, count do
		buffer[#buffer+1] = string.format(format, i)
	end

	current_line = vim.fn.getcurpos()[2]
	vim.api.nvim_buf_set_lines(0, current_line, current_line, false, buffer)
end, {
	desc = 'Create a numbered markdown list.',
	count = 100
})

vim.api.nvim_create_user_command('ShowRunOff', function()
	vim.cmd.highlight({'RunOff', 'term=bold', 'ctermbg=darkgrey', 'guibg=#592929' })
	vim.fn.matchadd('RunOff', '\\%' .. vim.opt.textwidth:get() .. 'v.*')
end, {
	desc = 'Highlight lines that are longer than the textwidth.'
})

vim.api.nvim_create_user_command('ShowRunOff78', function()
	vim.cmd.highlight({'RunOff', 'term=bold', 'ctermbg=darkgrey', 'guibg=#592929' })
	vim.fn.matchadd('RunOff', '\\%78v.*')
end, {
	desc = 'Highlight lines that are longer than the textwidth.'
})

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
