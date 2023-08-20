local M = {}

local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

-- Starts a terminal at count 5 running pytest on the current file.
function M.PyTestFile()
    vim.cmd('5TermExec cmd="pytest %"')
end

return M
