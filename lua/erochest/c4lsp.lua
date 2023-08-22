local M = {}

function M.setup(opts)
  local options = {
    name = "Structurizr C4 DSL",
    cmd = {'TODO'},
    root_dir = 'TODO',
  }

  for k, v in pairs(opts) do
    options[k] = v
  end
end

return M
