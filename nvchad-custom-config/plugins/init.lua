return {{"williamboman/nvim-lsp-installer"}, {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
        require("custom.configs.null-ls").setup()
    end
}, {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-M-a>", 'copilot#Accept("<CR>")', {
            silent = true,
            expr = true
        })
    end
}, {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    after = "telescope.nvim",
    config = function()
        require('telescope').load_extension('fzf')
    end
}, {
    "folke/which-key.nvim",
    config = function()
        require('custom.configs.which-key').setup()
    end
}, {"stevearc/dressing.nvim"}, {
    "Shatur/neovim-session-manager",
    after = {"plenary.nvim", "dressing.nvim"},
    config = function()
        require('custom.configs.session-manager').setup()
    end
}}
