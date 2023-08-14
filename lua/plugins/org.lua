return {
	{
		'arnarg/todotxt.nvim',
		dependencies = { 'MunifTanjim/nui.nvim', },
		cmd = {
			"ToDoTxtCapture",
			"ToDoTxtTasksToggle",
		},
		keys = {
			{ "<leader>tt", "<cmd>ToDoTxtTasksToggle<cr>", desc = "Toggle the todo list", mode = "n", },
			{ "<leader>tc", "<cmd>ToDoTxtCapture<cr>", desc = "Capture a new todo", mode = "n", },
		},
		config = function()
			local filenames = {
				"./todo.txt",
				"~/todo.txt",
				"~/.todo.txt",
				"~/.todo/todo.txt",
				"~/Dropbox/todo.txt",
			}
			local todo_file = nil
			for _, filename in ipairs(filenames) do
				if vim.fn.filereadable(filename) == 1 then
					todo_file = filename
					break
				end
			end
			require('todotxt-nvim').setup({
				todo_file = todo_file,
			})
		end,
	},

}
