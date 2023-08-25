function NeovimWithLife(transparency, color)
    color = color or "slate"
    vim.cmd.colorscheme(color)

    -- Set transparency background
    if transparency then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

NeovimWithLife(true, "github_dark")
