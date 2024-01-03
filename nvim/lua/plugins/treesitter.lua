return {
    "nvim-treesitter/nvim-treesitter", 
    config = function() 
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = { "vimdoc", "go", "vim", "query", "c", "lua", "rust" },

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
            },
        })
    end
}
