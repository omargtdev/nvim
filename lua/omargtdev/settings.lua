vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

local isWindowsOS = string.find(vim.loop.os_uname().sysname:lower(), "windows")
local home = isWindowsOS and "USERPROFILE" or "HOME"
print(home)
vim.opt.undodir = os.getenv(home) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- Util for following good wrapping practices
vim.opt.colorcolumn = "80"
--Set defaultcolumn space for specific type files
--vim.cmd("autocmd filetype java setlocal colorcolumn=100")
