
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


vim.keymap.set("n", "<leader>j", "ggO# Date: <C-R>=strftime('%a, %d %b %Y %H:%M:%S %z')<CR><CR>", { silent = true })

-- nmap <Leader>J <Leader>j<CR><ESC>k:r!~/bin/todo.sh archive<CR>{zz
-- "nmap <Leader>archive :r!todo.sh archive<CR>

vim.keymap.set("n", "<leader>pl", "o<ESC>\"+p", { silent = true })
vim.keymap.set("n", "<leader>dl", "\"+dd", { silent = true })
vim.keymap.set("n", "<leader>yy", "\"+yy", { silent = true })
vim.keymap.set("n", "<leader>l", "ggO<C-R>=strftime('%Y-%m-%dT%H:%M:%S %z')<CR><space>\\|<space>", { silent = true })

vim.keymap.set("i", "<leader>now", "<C-R>=strftime('%Y-%m-%dT%H:%M:%S%z')<CR>", { silent = true })
vim.keymap.set("n", "<leader>now", "i<leader>d", { silent = true })

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

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"debugloop/telescope-undo.nvim",
		},
		keys = {
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'grep' },
			{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffer' },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help pages' },
			{ '<leader>fs', '<cmd>Telescope spell_suggest<cr>', desc = 'Spelling suggestions for current word' },
			{ '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy find in current buffer' },
			{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						-- telescope-undo.nvim config, see below
					},
				},
			})
			require("telescope").load_extension("undo")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"pylsp",
				"rust_analyzer",
			},
		},
	},

	{ "hrsh7th/cmp-nvim-lsp", },
	{ "hrsh7th/cmp-nvim-lua", },
	{ "hrsh7th/cmp-buffer", },
	{ "hrsh7th/cmp-path", },
	{ "hrsh7th/cmp-cmdline", },
	{ "saadparwaiz1/cmp_luasnip", },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1, },
					{ name = "nvim_lua", group_index = 1, },
					{ name = "luasnip", group_index = 1, },
				}, {
					{ name = "buffer", group_index = 2, },
					{ name = "path", group_index = 2, },
				}),
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
			})

			vim.api.nvim_create_autocmd({
				"BufNewFile",
				"BufRead",
			}, {
				pattern = "*.py",
				callback = function()
					print('starting pylsp')
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig").pylsp.setup({
						capabilities = capabilities,
					})
				end,
			})
			vim.api.nvim_create_autocmd({
				"BufNewFile",
				"BufRead",
			}, {
				pattern = "*.rs",
        callback = function()
					print('starting rust-analyzer')
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					lspconfig.rust_analyzer.setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},

	{
		"github/copilot.vim",
		cmd = { "Copilot", },
		keys = {
			{
				"<leader>cp",
				"<cmd>Copilot<CR>",
				mode = "n",
				desc = "Copilot",
			},
		},
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = { "github/copilot.vim", },
	-- 	config = true,
	-- },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- add from https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
				ensure_installed = {
					"css",
					"html",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"graphql",
					"javascript",
					"jsonc",
					"lua",
					"make",
					"markdown_inline",
					"python",
					"query",
					"rust",
					"todotxt",
					"toml",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		},
	},
	{ "mfussenegger/nvim-dap-python", },
	{ "theHamsta/nvim-dap-virtual-text", },
	{ "rcarriga/nvim-dap-ui", },

	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		keys = {
			{ "<C-K>", function() require("luasnip").expand() end, mode = {"i"}, silent = true, },
			{ "<C-L>", function() require("luasnip").jump( 1) end, mode = {"i", "s"}, silent = true, },
			{ "<C-J>", function() require("luasnip").jump(-1) end, mode = {"i", "s"}, silent = true, },
			{
				"<C-E>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				mode = {"i"}, silent = true,
			},
		},
		config = function()
			require("luasnip").setup({})
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},

	{
		"norcalli/snippets.nvim",
		keys = {
			{
				"<c-k>",
				function() return require("snippets").expand_or_advance(1) end,
				mode = "i",
				desc = "Expand the snippet",
			},
			{
				"<c-j>",
				function() return require("snippets").advance_snippet(-1) end,
				mode = "i",
				desc = "Previous snippet",
			},
		},
		config = function()
			require("snippets").snippets = {
				_global = {
					date = os.date;
					now = function() return os.date("%Y-%m-%d %H:%M:%S") end;
				},
			}
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			lint = require("lint")
			lint.linters_by_ft = {
				json = { "jsonlint", },
				lua = { "luacheck", },
				markdown = { "vale", },
				python = { "flake8", "mypy", "pylint" },
				yaml = { "yamllint", },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"mhartington/formatter.nvim",
		keys = {
			{
				"<leader>fm",
				"<cmd>Format<CR>",
				mode = "n",
				desc = "Format the current buffer",
			},
			{
				"<leader>fM",
				"<cmd>FormatWrite<CR>",
				mode = "n",
				desc = "Format the current buffer and write it to disk",
			},
		},
		cmd = {
			"Format",
			"FormatWrite",
			"FormatLock",
			"FormatWriteLock",
		},
		event = {
			"BufWritePre",
		},
		config = function()
			formatter = require("formatter")
			formatter.setup({
				logging = false,
				filetype = {
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace
					},
					["json"] = {
						require("formatter.filetypes.json").prettier,
					},
					["lua"] = {
						require("formatter.filetypes.lua").lua_format,
					},
					["markdown"] = {
						require("formatter.filetypes.markdown").prettier,
					},
					["python"] = {
						require("formatter.filetypes.python").black,
						require("formatter.filetypes.python").isort,
					},
					["rust"] = {
						require("formatter.filetypes.rust").rustfmt,
					},
					["toml"] = {
						require("formatter.filetypes.toml").prettier,
					},
					["yaml"] = {
						require("formatter.filetypes.yaml").prettier,
					},
				},
			})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				command = "FormatWrite",
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeClose",
			"NvimTreeRefresh",
			"NvimTreeFindFile",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{ "nvim-tree/nvim-web-devicons", },

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
		cmd = {
			"PossessionSave",
			"PossessionLoad",
			"PossessionRename",
			"PossessionClose",
			"PossessionDelete",
			"PossessionShow",
			"PossessionList",
			"PossessionMigrate",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", },
		config = true,
		lazy = false,
	},

})

-- DONE: nvim-cmp https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- DONE: nvim-treesitter https://github.com/nvim-treesitter/nvim-treesitter
-- DONE: nvim-dap https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
-- DONE: nvim-dap-ui https://github.com/rcarriga/nvim-dap-ui#usage
-- DONE: snippets https://github.com/hrsh7th/nvim-cmp#recommended-configuration
-- DONE: linters https://github.com/williamboman/mason.nvim#how-to-use-installed-packages
-- DONE: formatters https://github.com/williamboman/mason.nvim#how-to-use-installed-packages
-- DONE: telescope-undo
-- TODO: copilot-cmp
-- DONE: statusline
-- DONE: nvim-tree
-- DONE: which-key
-- DONE: possession
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- DONE: lsp keybindings
-- DONE: lsp cmp capabilities
-- DONE: add mason/bin to path
-- DONE: connect snippets to nvim-cmp
-- TODO: dapui usage https://github.com/rcarriga/nvim-dap-ui#usage
-- TODO: python file handler https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
-- TODO: rust file handler https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- TODO: tab nav keybindings (eg, `gh` for next tab, `gl` for previous tab)
--
-- TODO: break plugins out into separate files under `lua/plugins`
-- TODO: lspkind https://github.com/onsails/lspkind.nvim
-- -- and copilot-cmp
