
-- Nothing to see here. Move along, citizen.

vim.opt.backup = true
vim.opt.backupskip = "/tmp/*,/private/tmp/*"
vim.opt.backspace = "indent,eol,start"
vim.opt.hlsearch = true
vim.opt.joinspaces = false
vim.opt.modeline = true
vim.opt.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore= "*.swp,*.bak,*.pyc,*.ho,*.hi,*.o"
-- vim.opt.pastetoggle=<F2>
vim.opt.cursorline = true
vim.opt.wildmenu = true

vim.g.mapleader = " "

-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
vim.keymap.set("v", "Q", "gq")
vim.keymap.set("n", "Q", "gqap")
vim.keymap.set("n", "<silent><leader>/", ":nohlsearch<CR>")
vim.keymap.set("n", "<silent><leader>S", ":set nospell<CR>")

