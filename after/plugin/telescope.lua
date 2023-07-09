if not pcall(require, "telescope") then return end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fG", function()
	if not pcall(builtin.git_files) then
		print("Does not exist a git directory in this project.")
	end
end, {})
vim.keymap.set("n", "<leader>fg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
