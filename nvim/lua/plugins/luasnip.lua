return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.2.1",
    build = "make install_jsregexp",
    config = function(_)
        local luasnip = require"luasnip"

        luasnip.config.set_config({
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave'
        })

        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
