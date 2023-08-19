
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal textwidth=0
setlocal foldcolumn=1

lua << EOF
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        library = {
          "${3rd}/luv/library",
	},
      },
    },
  },
})
-- * `Lua.workspace.library`: add element `"${3rd}/luv/library"` ;
EOF
