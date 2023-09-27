
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

vim.keymap.set("v", "Q", "gq",   { desc = "Reformat the selection." })
vim.keymap.set("n", "Q", "gqap", { desc = "Reformat the current paragraph." })
vim.keymap.set("n", "gn", ":tabn<cr>", { desc = "Go to the next tab." })
vim.keymap.set("n", "gN", ":tabN<cr>", { desc = "Go to the previous tab." })
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
-- vim.keymap.set("n", "<leader>http", vim.cmd.Browser)

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

vim.api.nvim_create_user_command('ShiftWin', function()
	vim.opt.winheight = 5
	vim.opt.winminheight = 5
	vim.opt.winheight = 999
	vim.keymap.set("n", "<C-w>j", "<C-w>j<C-w>_", { silent = true })
	vim.keymap.set("n", "<C-w>k", "<C-w>k<C-w>_", { silent = true })
end, {
	desc = 'For automatically resizing windows when you navigate.'
})

-- " From https://gist.github.com/lmullen/426094d4cac517bbb292:
-- "
-- " Add all flags in the style {TODO: description} or {PAGE} in current document
-- " to quickfix list
vim.api.nvim_create_user_command('ListTodo', function()
	vim.cmd.vimgrep('/\\v\\{[A-Z]+(:\\_.{-})?\\}/gj', '%')
	vim.cmd.copen()
end, {
	desc = 'Add all flags in the style {TODO: description} or {PAGE} in current document to quickfix list.'
})


vim.api.nvim_create_user_command('ListTodoR', function()
	vim.cmd.vimgrep('/\\v\\{[A-Z]+(:\\_.{-})?\\}/gj', './**/*.md')
	vim.cmd.copen()
end, {
	desc = 'Add all flags in the style {TODO: description} or {PAGE} in current document and subdirectories to quickfix list.'
})

-- I really haven't tested this one, and I don't remember using it much, so
-- Imma just comment it away.
--
-- -- " From http://www.kornerstoane.com/2014/06/why-i-cant-stop-using-vim/
-- -- " Search for any .vimsettings files in the path to the file.
-- -- " Source them if you find them.
-- vim.api.nvim_create_user_command('ApplyLocalSettings', function()
-- 	-- First don't try to walk a remote directory tree.
-- 	netrwProtocol = string.sub(vim.fn.getcwd(), 0, string.find(vim.fn.getcwd(), "://"))
-- 	if netrwProtocol ~= "" then
-- 		return
-- 	end
--
-- 	-- convert windows paths to unix style (they still work)
-- 	curDir = vim.fn.substitute(vim.fn.getcwd(), "\\", "/", "g")
-- 	parentDir = string.sub(curDir, 0, string.find(curDir, "/[^/]*$"))
-- 	if vim.fn.isdirectory(parentDir) == 1 then
-- 		vim.cmd.ApplyLocalSettings(parentDir)
-- 	end
--
-- 	-- now walk up the path and source .vimsettings as you find them. This way
-- 	-- child directories can 'inherit' from their parents
-- 	settingsFile = vim.fn.getcwd() .. "/.vimsettings"
-- 	if vim.fn.filereadable(settingsFile) == 1 then
-- 		vim.cmd.source(settingsFile)
-- 	end
-- end, {
-- 	desc = 'Search for any .vimsettings files in the path to the file. Source them if you find them.'
-- })
-- vim.api.nvim_create_autocmd({'BufEnter'}, {
-- 	pattern = '*',
-- 	callback = vim.cmd.ApplyLocalSettings,
-- })

-- nmap <Leader>J <Leader>j<CR><ESC>k:r!~/bin/todo.sh archive<CR>{zz
-- "nmap <Leader>archive :r!todo.sh archive<CR>

vim.keymap.set("n", "<leader>Cp", "o<ESC>\"+p", { silent = true, desc = "Paste onto a new line" })
vim.keymap.set("n", "<leader>Cd", "\"+dd", { silent = true, desc = "Cut this line" })
vim.keymap.set("n", "<leader>Cy", "\"+yy", { silent = true, desc = "Copy this line" })
-- vim.keymap.set("n", "<leader>l", "ggO<C-R>=strftime('%Y-%m-%dT%H:%M:%S %z')<CR><space>\\|<space>", {
    -- silent = true,
    -- desc = "Insert a timestamp at the top of the file.",
-- })

-- vmap <Leader>x :SlimuxREPLSendSelection<CR>
-- nmap <Leader>x :SlimuxREPLSendLine<CR>
-- nmap <Leader>tmux :SlimuxREPLConfigure<CR>
--
-- vmap <Leader>tsh :SlimuxShellPrompt<CR>
-- nmap <Leader>ts! :SlimuxShellLast<CR>
-- nmap <Leader>retsh :SlimuxShellConfigure<CR>

-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/#plugin-manager
-- Finally adding a plugin manager: lazy.nvim

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- vim.o.background = "light"
vim.o.background = "dark"
--
-- vim.cmd("colorscheme nord")
-- vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")
-- vim.g.material_style = "lighter"
-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "oceanic"
-- vim.g.material_style = "palenight"
--
-- vim.cmd("colorscheme solarized")
vim.cmd("colorscheme solarized-high")
-- vim.cmd("colorscheme slate")
