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
        "L3MON4D3/LuaSnip",
    },
    config = function(_)
        local luasnip = require"luasnip"
        local cmp = require"cmp"
        local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

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
                {name = 'luasnip', keyword_length = 2},
                {name = 'nvim_lsp', keyword_length = 3},
                {name = 'buffer', keyword_length = 4},
                {name = 'path'},
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
                })
            },
            formatting = {
                fields = {'abbr', 'menu', 'kind'},
                format = function(entry, item)
                    local short_name = {
                        nvim_lsp = 'LSP',
                        nvim_lua = 'nvim'
                    }

                    local menu_name = short_name[entry.source.name] or entry.source.name

                    item.menu = string.format('[%s]', menu_name)
                    return item
                end,
            },
            mapping = {
                -- confirm selection
                ['<C-y>'] = cmp.mapping.confirm({select = false}),

                -- navigate items on the list
                ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),

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
                end, {'i', 's'}),

                -- go to previous placeholder in the snippet
                ['<C-b>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
            },
            experimental = {
                native_menu = false,
                ghost_text = true,
            }
        }

        vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
        cmp.setup(cmp_config)
    end,
}

