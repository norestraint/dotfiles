return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		---@type conform.setupOpts
		local opts = {
			formatters_by_ft = {
				bash = { "beautysh" },
				css = { "prettier" },
				elixir = { "mix format" },
				fish = { "fish_indent" },
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
				python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				kdl = { "kdlfmt" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 2000,
			},
			-- The options you set here will be merged with the builtin formatters.
			-- You can also define any custom formatters here.
			---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
		}

		conform.setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
