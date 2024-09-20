return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {

            char = "┆",
        },
        scope = {
            show_start = false,
        }
    },
    config = function(_, opts)
       require("ibl").setup(opts)
    end
}
