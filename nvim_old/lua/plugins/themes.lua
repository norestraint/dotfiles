return {
    { 'rose-pine/neovim',      name = 'rose-pine' },
    { "catppuccin/nvim",       name = "catppuccin" },
    { "rebelot/kanagawa.nvim", name = "kanagawa" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = ...
    }
}
