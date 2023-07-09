vim.g.mapleader = " "

vim.keymap.set("n", "<leader>nd", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")

-- Move lines easily
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Put the following line at the end of this line
vim.keymap.set("n", "J", "mzJ`z")

-- When moves, focus the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste and don't lose it by cutting other
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copying to clipboard
vim.keymap.set("n", "<leader>y", [["+y]]) -- Set specific lines, words
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Entire line
vim.keymap.set("v", "<leader>y", [["+y]]) -- Selected region

-- Don't cut when removing with 'd'
vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file as an executable
vim.keymap.set("n", "<leader>x", function ()
    vim.fn.system("chmod u+x " .. vim.fn.expand("%"))
end, { silent = true })

vim.keymap.set("n", "<leader><leader>", function ()
    vim.cmd("so")
end)
