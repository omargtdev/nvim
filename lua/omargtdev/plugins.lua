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

    -- Harpoon
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'

    -- Check changes in current file
    use 'mbbill/undotree' -- Amazing!
    
    -- Parsing, highlightly and indenting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Git
    use 'tpope/vim-fugitive'

    -- LSP
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

    -- Theme
    use ({ 'projekt0n/github-nvim-theme' })

end)
