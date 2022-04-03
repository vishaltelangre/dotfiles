local M = {}

M.treesitter = {
    ensure_installed = {"lua", "vim", "html", "ruby", "css", "yaml", "json", "jsonc", "bash", "javascript",
                        "typescript", "tsx", "rust", "scss", "markdown"}
}

M.nvimtree = {
    git = {
        enable = true
    },
    view = {
        side = "left",
        width = 30
    }
}

M.indent_blankline = {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true
}

return M
