return {
    -- https://www.lazyvim.org/plugins/lsp
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
        { "folke/neodev.nvim",  opts = {} },
    },

    keys = {

    },
    opts = {
        diagnostics = {
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
            },
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
            enabled = true,
        },
        -- add any global capabilities here
        capabilities = {},
        -- Automatically format on save
        autoformat = true,
        -- Enable this to show formatters used in a notification
        -- Useful for debugging formatter issues
        format_notify = false,
        format = {
            formatting_options = nil,
            timeout_ms = nil,
        },

        -- LSP Server Settings
        ---@type lspconfig.options
        servers = {
        },

        setup = {
            -- example to setup with typescript.nvim
            -- tsserver = function(_, opts)
            --   require("typescript").setup({ server = opts })
            --   return true
            -- end,
            -- Specify * to use this function as a fallback for any server
            -- ["*"] = function(server, opts) end,
        },
    },
    ---@param opts PluginLspOpts
    config = function(opts)
        local lspconfig = require("lspconfig")
        local util = require("lspconfig/util")

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>le', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>FF',
                    function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                -- Diagnostics
                vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

                local sign = function(params)
                    vim.fn.sign_define(params.name, {
                        texthl = params.name,
                        text = params.text,
                        numhl = ''
                    })
                end

                sign({ name = 'DiagnosticSignError', text = '✘' })
                sign({ name = 'DiagnosticSignWarn', text = '▲' })
                sign({ name = 'DiagnosticSignHint', text = '⚑' })
                sign({ name = 'DiagnosticSignInfo', text = '' })
            end
        })
    end
}
