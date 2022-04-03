local M = {}

M.setup = function()
    local wk = require('which-key')

    wk.register({
        ["<leader>"] = {
            -- General
            w = {':w!<CR>', 'save file'},
            x = 'close buffer',
            q = 'close buffer',
            X = {':wq!<CR>', 'save and quit file'},

            -- Telescope
            t = {
                name = '+Telescope prefix',
                s = {':Telescope <CR>', 'Telescope'},
                t = {':Telescope themes <CR>', 'Telescope themes'}
            },

            -- Line numbers
            n = {
                name = "+line numbers",
                t = {':set nu!<CR>', 'toggle line numbers'},
                r = {':set rnu!<CR>', 'toggle relative line numbers'}
            },

            -- NVChad
            ["uu"] = "update NVChad",
            ["?"] = {":lua require('nvchad.cheatsheet').show() <CR>", "cheatsheet"},

            -- Highlighting
            ['<CR>'] = {':noh<CR>', 'no search hl'},

            -- Comments
            ["/"] = "Toggle comment",

            -- Terminal
            h = "toggle horizontal terminal",
            v = "toggle vertical terminal",
            H = "new horizontal terminal",
            V = "new vertical terminal",
            W = "show & recover hidden terminal buffers in a telescope picker",

            -- Find
            f = {
                name = '+find',
                f = "files",
                o = "old files",
                a = "hidden files",
                w = "files by 'rg' live grep search",
                b = 'buffers',
                h = 'help tags',
                -- Commands
                c = {
                    name = '+commands',
                    c = {'<Cmd>Telescope commands<CR>', 'commands'},
                    h = {'<Cmd>Telescope command_history<CR>', 'history'}
                },
                -- Git
                g = {
                    name = '+git',
                    g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
                    c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
                    b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
                    s = {'<Cmd>Telescope git_status<CR>', 'status'}
                }
            },

            -- LSP config
            l = {
                name = "+lsp",
                d = {"<Cmd>lua vim.diagnostic.open_float(0, {scope='line', source=true})<CR>", 'show diagnostics'},
                v = {'<Cmd>lua vim.diagnostic.toggle()<CR>', 'toggle diagnostics'},
                c = {'<Cmd>lua R("funcs.highlight").toggle_bright_comments()<CR>', 'toggle bright comments'},
                Q = {"<Cmd>lua vim.diagnostic.setloclist()<CR>", 'set loclist'},
                u = {'<Cmd>LspStart<CR>', 'start'},
                i = {'<Cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
                Z = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration'},
                z = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'definition'},
                r = {'<Cmd>lua vim.lsp.buf.references()<CR>', 'references'},
                t = {'<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
                K = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
                s = {'<Cmd>lua vim.lsp.buf.incoming_calls()<CR>', 'incoming'},
                S = {'<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>', 'outgoing'},
                o = {'<Cmd>lua vim.lsp.buf.document_symbol()<CR>', 'symbols'},
                g = {'<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature help'},
                a = {'<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace'},
                R = {'<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace'},
                l = {'<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace'},
                q = {"<Cmd>lua vim.lsp.buf.code_action()<CR>", 'code action'},
                f = {'<Cmd>lua vim.lsp.buf.formatting()<CR>', 'format'}
            }
        },

        -- Buffers
        ["<S-t>"] = "new buffer",
        ["<TAB>"] = "next buffer",
        ["<S-TAB>"] = "prev buffer",
        ["<C-t>b"] = "new tab",

        -- Window movement
        ["<C-h>"] = "move window left",
        ["<C-l>"] = "move window right",
        ["<C-k>"] = "move window up",
        ["<C-j>"] = "move window down",

        -- NvimTree
        ["<C-n>"] = "Toggle NvimTree",

        -- Misc
        ["<C-c>"] = {'<Esc>', 'close buffer'},
        ["<C-s>"] = "save file",
        ["<C-f>m"] = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", "format"},
        ['[d'] = {'<PageUp>', "Page up"},
        [']d'] = {'<PageDown>', "Page down"}
    })

    wk.register({
        -- Navigation in insert mode
        ["<C-h>"] = "move cursor left",
        ["<C-l>"] = "move cursor right",
        ["<C-k>"] = "move cursor up",
        ["<C-j>"] = "move cursor down",
        ["<C-e>"] = "move cursor to end of line",
        ["<C-a>"] = "move cursor to beginning of line",

        -- Better escape
        ["jk"] = "escape insert mode"
    }, {
        prefix = "",
        mode = "i"
    })

    wk.register({
        ["<leader>"] = {
            -- Comments
            ["/"] = "Toggle comment"
        }
    }, {
        prefix = "",
        mode = "v"
    })
end

return M
