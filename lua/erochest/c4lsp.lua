local M = {}

function M.setup(opts)

  local options = {
    name = "Structurizr C4 DSL",
    cmd = {'c4-language-server'},
    root_dir = vim.fs.dirname(vim.fs.find('.git', {upward=true, type='directory'})[0]),
    filetypes = {"structurizr"}
  }

  for k, v in pairs(opts) do
    options[k] = v
  end

  vim.lsp.start(options)
end

return M
