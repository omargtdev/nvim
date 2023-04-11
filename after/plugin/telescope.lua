local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
vim.keymap.set("n", "<leader>tg", function()
	if not pcall(builtin.git_files) then
		print("Does not exist a git directory in this project.")
	end
end, {})
vim.keymap.set("n", "<leader>ts", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })

end, {})
