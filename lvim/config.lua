--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

vim.api.nvim_set_keymap('i', '<Tab>', '<Tab>', { noremap = true, silent = true })

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.leader = "space"
lvim.colorscheme = "catppuccin-mocha"

lvim.keys.normal_mode["<leader>w"] = ":w<cr>"
lvim.keys.normal_mode["<leader>t"] = ":ToggleTerm<cr>"
lvim.keys.normal_mode["<leader>T"] = ":TroubleToggle<cr>"

lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"

-- I'm not exactly sure about this but it's working and I'm not in the mood to debug.
lvim.keys.normal_mode["<C-h>"] = ":wincmd h<CR>"
lvim.keys.normal_mode["<C-j>"] = ":wincmd j<CR>"
lvim.keys.normal_mode["<C-k>"] = ":wincmd k<CR>"
lvim.keys.normal_mode["<C-l>"] = ":wincmd l<CR>"

lvim.keys.normal_mode["<C-h>"] = ":TmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = ":TmuxNavigateDown<CR>"
lvim.keys.normal_mode["<C-k>"] = ":TmuxNavigateUp<CR>"
lvim.keys.normal_mode["<C-l>"] = ":TmuxNavigateRight<CR>"

lvim.keys.normal_mode["<leader>xt"] = ":TestNearest -strategy=vimux<CR>"
lvim.keys.normal_mode["<leader>xT"] = ":TestFile -strategy=vimux<CR>"
lvim.keys.normal_mode["<leader>xa"] = ":TestSuite -strategy=vimux<CR>"
lvim.keys.normal_mode["<leader>xl"] = ":TestLast -strategy=vimux<CR>"
lvim.keys.normal_mode["<leader>xg"] = ":TestVisit -strategy=vimux<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.lir.show_hidden_files = true
lvim.builtin.cmp.experimental.ghost_text = true


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "typescript",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
lvim.plugins = {
  { "folke/trouble.nvim",            cmd = "TroubleToggle" },
  { "christoomey/vim-tmux-navigator" },
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux"
    },
  },

  -- Themes
  { "catppuccin/nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rebelot/kanagawa.nvim" },

  -- For Flutter stuff(ngl I don't vibe with Flutter at this point in time)
  { 'dart-lang/dart-vim-plugin' },
  { 'thosakwe/vim-flutter' },
  { 'natebosch/vim-lsc' },
  { 'natebosch/vim-lsc-dart' }

}
