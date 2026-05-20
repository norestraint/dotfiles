local ok, snacks = pcall(require, "snacks")
if not ok then
  vim.notify("Unable to load snacks")
  return {}
end

---@type snacks.Config
local opts = {
  terminal = { enable = true }
}

local start_snacks = function()
  snacks.setup(opts)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end

      -- Override print to use snacks for `:=` command
      if vim.fn.has("nvim-0.11") == 1 then
        vim._print = function(_, ...)
          dd(...)
        end
      else
        vim.print = _G.dd
      end
    end,
  })
end

start_snacks()

vim.keymap.set("n", "<c-/>", function()
  ---@module 'snacks'
  Snacks.terminal()
end, { desc = "Toggle Terminal" })


vim.keymap.set("n", "<leader>bd", function()
  ---@module 'snacks'
  Snacks.bufdelete()
end, { desc = "Delete current buffer" })


vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

vim.keymap.set("n", "gr", function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
