return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-lint",
    "mhartington/formatter.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler (optional)
        local lspconfig = require("lspconfig")
        local util = require("lspconfig/util")

        local on_attach = require("plugins.lspconfig").on_attach
        local capabilities = require("plugins.lspconfig").capabilities

        if server_name == "rust-analyzer" then
          return
        end

        if server_name == "gopls" then
          lspconfig.gopls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                ununsedparams = true,
              }
            }
          }
        end
        require("lspconfig")[server_name].setup {}
      end,
    }

    local util = require "formatter.util"
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
          function()
            if util.get_current_buffer_file_name() == "special.lua" then
              return nil
            end
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end
        },

        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    }
  end
}
