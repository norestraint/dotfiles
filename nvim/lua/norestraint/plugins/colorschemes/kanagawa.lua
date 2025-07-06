return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme kanagawa-wave")
    vim.cmd("highlight LineNr guibg=#1F1F28")
  end,
}
