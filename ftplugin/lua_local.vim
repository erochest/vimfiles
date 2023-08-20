
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
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
