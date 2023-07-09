if not pcall(require, "lsp-zero") then return end

local lsp = require("lsp-zero").preset({
    manage_nvim_cmp = {
        set_sources = "recommended"
    }
})

lsp.on_attach(function(client, bufnr)
    -- Check defaults
    lsp.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gf", function() vim.lsp.buf.format() end, opts)
end)

lsp.ensure_installed({
    "tsserver",
    "eslint"
})

-- Configure language servers
local lspconfig = require("lspconfig")

-- TODO: Set autocomplete functions
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
