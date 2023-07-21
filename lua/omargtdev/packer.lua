-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ok, packer = pcall(require, 'packer')

if not ok then return end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake
        --build build --config Release && cmake --install build --prefix build]]
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Themes
    use 'folke/tokyonight.nvim'

    -- Parsing, highlightly and indenting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'


    --use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'

    use 'mbbill/undotree' -- Amazing!
    use 'tpope/vim-fugitive'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                          -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },   -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },   -- Required
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    }
end)
