return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      transparent = "#1F1F28",
      white = "#c0caf5",
      black = "#15161e",
      pink = "#f7768e",
      red = "#db4b4b",
      green = "#9ece6a",
      orange = "#e0af68",
      blue = "#7aa2f7",
      purple = "#bb9af7",
      light_blue = "#7dcfff",
      light_purple = "#a9b1d6",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.purple },
        b = { fg = colors.black, bg = colors.purple },
        c = { fg = colors.white, bg = colors.transparent },
        x = { fg = colors.white, bg = colors.transparent },
        y = { fg = colors.black, bg = colors.purple },
        z = { fg = colors.black, bg = colors.purple },
      },

      insert = {
        a = { fg = colors.transparent, bg = colors.green },
        b = { fg = colors.transparent, bg = colors.green },
      },
      visual = {
        a = { fg = colors.transparent, bg = colors.pink },
        b = { fg = colors.transparent, bg = colors.pink },
      },
      replace = {
        a = { fg = colors.transparent, bg = colors.red },
        b = { fg = colors.transparent, bg = colors.red },
      },

      inactive = {
        a = { fg = colors.white, bg = colors.transparent },
        b = { fg = colors.white, bg = colors.transparent },
        c = { fg = colors.transparent, bg = colors.transparent },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "branch" },
        lualine_c = { "diagnostics", "diff", "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#FF9E64" },
          },
          { "enconding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
