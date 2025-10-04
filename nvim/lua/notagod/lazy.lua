local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "notagod.plugins" },
  { import = "notagod.plugins.lsp" },
  { import = "notagod.plugins.colorschemes" },
  { import = "notagod.plugins.debugger" },
  { import = "notagod.plugins.mini" },
}, {
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
})

vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")
vim.cmd("highlight DiagnosticSignError guibg=NONE")
vim.cmd("highlight DiagnosticSignWarn guibg=NONE")
vim.cmd("highlight DiagnosticSignInfo guibg=NONE")
vim.cmd("highlight DiagnosticSignHint guibg=NONE")
vim.cmd("highlight DiagnosticSignOk guibg=NONE")
