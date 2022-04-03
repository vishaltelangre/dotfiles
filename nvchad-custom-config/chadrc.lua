local M = {}

-- PLUGINS
local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"

M.plugins = {
    install = userPlugins,

    default_plugin_config_replace = {
        nvim_treesitter = pluginConfs.treesitter,
        nvim_tree = pluginConfs.nvimtree,
        indent_blankline = pluginConfs.indent_blankline
    },
    options = {
        lspconfig = {
            setup_lspconf = "custom.configs.lspconfig"
        }
    }
}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
    theme = "onedark"
}

M.mappings = {
    -- Nuke/reset default NVChad mappings (check 'which-key' mappings instead)
    misc = {
        cheatsheet = "",
        cp_whole_file = "",
        lineNR_toggle = "",
        lineNR_rel_toggle = ""
    },
    plugins = {
        lspconfig = {
            add_workspace_folder = "",
            remove_workspace_folder = "",
            list_workspace_folders = "",
            type_definition = "",
            rename = "",
            code_action = "",
            set_loclist = "",
            formatting = ""
        },
        telescope = {
            git_commits = "",
            git_status = "",
            themes = ""
        },
        nvimtree = {
            focus = ""
        }
    }
}

return M
