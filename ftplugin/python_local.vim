
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal textwidth=0
setlocal foldcolumn=1
setlocal foldmethod=indent

lua <<EOF
local kmap = vim.keymap.set

kmap("n", "<leader>cp", function() require("erochest.python").PyTestFile() end, {
	desc="Run pytest on current file",
})
kmap("n", "<leader>dn", function() require("dap-python").test_method() end, {
	desc="Debug pytest on current method",
})
kmap("n", "<leader>df", function() require("dap-python").test_class() end, {
	desc="Debug pytest on current class",
})
kmap("v", "<leader>ds", function() require("dap-python").debug_selection() end, {
	desc="Debug pytest on current selection",
})

EOF
