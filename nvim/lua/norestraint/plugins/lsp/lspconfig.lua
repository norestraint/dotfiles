return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local handlers = {
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["ruby_lsp"] = function()
				local util = require("lspconfig.util")
				lspconfig.ruby_lsp.setup({
					cmd = { "ruby-lsp" },
					filetypes = { "ruby", "eruby" },
					root_dir = util.root_pattern("Gemfile", ".git"),
					init_options = {
						formatter = "auto",
					},
					single_file_support = true,
				})
			end,
			["html"] = function()
				lspconfig.html.setup({
					capabilities = capabilities,
					cmd = { "vscode-html-language-server", "--stdio" },
					filetypes = { "html", "templ", "html-eex", "heex", "html.eex" },
					root_dir = lspconfig.util.root_pattern("package.json", ".git"),
					single_file_support = true,
					settings = {},
					init_options = {
						provideFormatter = true,
						embeddedLanguages = { css = true, javascript = true },
						configurationSection = { "html", "css", "javascript" },
					},
				})
			end,
			["elixirls"] = function()
				lspconfig.elixirls.setup({
					capabilities = capabilities,
					cmd = { "/home/norestraint/.elixirls/language_server.sh" },
				})
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["ts_ls"] = function()
				local util = require("lspconfig.util")
				lspconfig.html.setup({
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				})
				lspconfig.ts_ls.setup({
					init_options = { hostInfo = "neovim" },
					cmd = { "typescript-language-server", "--stdio" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
					single_file_support = true,
				})
			end,
		}

		mason_lspconfig.setup({
			ensure_installed = mason_lspconfig.get_installed_servers(),
			automatic_installation = true,
			handlers = handlers,
		})
	end,
}
