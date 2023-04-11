vim.keymap.set("n", "<leader>gs", function() 
	if not pcall(vim.cmd.Git) then
		print("Does not exist a git directory in this project.")
	end
end)
