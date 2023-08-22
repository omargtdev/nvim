if not pcall(require, "lsp-zero") then return end

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local map = vim.keymap.set

    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    map('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    map({ 'n', 'x' }, 'gf', function() vim.lsp.buf.format() end, opts)
    map('n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end)

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "bashls"
})

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Completion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 }
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(cmp_select_opts)
                return
            end
            fallback()
        end),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
                return
            end
            fallback()
        end)
    }
})
