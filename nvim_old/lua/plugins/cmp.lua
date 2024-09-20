return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-vsnip",
    },
    config = function(_)
        local luasnip = require "luasnip"
        local cmp = require "cmp"
        local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

        local cmp_config = {
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'vsnip',                  keyword_length = 2 },
                { name = 'luasnip',                keyword_length = 2 },
                { name = 'nvim_lsp',               keyword_length = 2 },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua',               keyword_length = 2 },
                { name = 'buffer',                 keyword_length = 3 },
                { name = 'path' },
                { name = 'calc' },

            },
            window = {
                documentation = vim.tbl_deep_extend(
                    'force',
                    cmp.config.window.bordered(),
                    {
                        max_height = 15,
                        max_width = 60,
                        min_height = 10,
                        min_width = 30,
                    }
                ),
                completion = vim.tbl_deep_extend(
                    'force',
                    cmp.config.window.bordered(),
                    {
                        max_height = 15,
                        max_width = 35,
                        min_height = 10,
                        min_width = 30,
                    }
                ),
            },
            formatting = {
                fields = { 'abbr', 'menu', 'kind' },
                format = function(entry, item)
                    local short_name = {
                        nvim_lsp = 'LSP',
                        nvim_lua = 'nvim'
                    }

                    local kind_icons = {
                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰂡",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                    }

                    local menu_icon = {
                        nvim_lsp = "λ",
                        luasnip = "λ",
                        vsnip = "⋗",
                        buffer = "Ω",
                        path = "🖫",
                    }

                    local menu_name = short_name[entry.source.name] or entry.source.name
                    local icon = menu_icon[entry.source.name]

                    if icon == nil then
                        item.menu = string.format('[%s]', menu_name)
                    else
                        item.menu = string.format('[%s| %s]', icon, menu_name)
                    end
                    item.name = string.format("%.20s", entry.name)

                    return item
                end,
            },
            mapping = {
                -- confirm selection
                ['<C-y>'] = cmp.mapping.confirm({ select = false }),

                -- navigate items on the list
                ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),

                -- scroll up and down in the completion documentation
                ['<C-f>'] = cmp.mapping.scroll_docs(5),
                ['<C-u>'] = cmp.mapping.scroll_docs(-5),

                -- toggle completion
                ['<C-e>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                        fallback()
                    else
                        cmp.complete()
                    end
                end),

                -- go to next placeholder in the snippet
                ['<C-d>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                -- go to previous placeholder in the snippet
                ['<C-b>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            experimental = {
                native_menu = false,
                ghost_text = true,
            }
        }
        cmp.setup(cmp_config)
    end,
}
