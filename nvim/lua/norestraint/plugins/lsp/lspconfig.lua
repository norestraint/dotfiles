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
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["html"] = function()
				lspconfig["html"].setup({
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
				-- configure elixir server
				lspconfig["elixirls"].setup({
					capabilities = capabilities,
					cmd = { "/home/norestraint/.elixirls/language_server.sh" },
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
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
			["tailwindcss"] = function()
				lspconfig["tailwindcss"].setup({
					capabilities = capabilities,
					cmd = { "tailwindcss-language-server", "--stdio" },
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									'class[:]\\s*"([^"]*)"',
								},
							},
							validate = true,
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidScreen = "error",
								invalidVariant = "error",
								invalidConfigPath = "error",
								invalidTailwindDirective = "error",
								recommendedVariantOrder = "warning",
							},
							classAttributes = {
								"class",
								"className",
								"class:list",
								"classList",
								"ngClass",
							},
							includeLanguages = {
								eelixir = "html-eex",
								eruby = "erb",
								templ = "html",
								htmlangular = "html",
							},
						},
					},
					init_options = {
						userLanguages = {
							elixir = "html-eex",
							eelixir = "html-eex",
							heex = "html-eex",
						},
					},
					root_dir = function(fname)
						return lspconfig.util.root_pattern(
							"tailwind.config.js",
							"tailwind.config.cjs",
							"tailwind.config.mjs",
							"tailwind.config.ts",
							"postcss.config.js",
							"postcss.config.cjs",
							"postcss.config.mjs",
							"postcss.config.ts"
						)(fname) or vim.fs.dirname(
							vim.fs.find("package.json", { path = fname, upward = true })[1]
						) or vim.fs.dirname(vim.fs.find("node_modules", { path = fname, upward = true })[1]) or vim.fs.dirname(
							vim.fs.find(".git", { path = fname, upward = true })[1]
						)
					end,
					filetypes = {
						-- html
						"aspnetcorerazor",
						"astro",
						"astro-markdown",
						"blade",
						"clojure",
						"django-html",
						"htmldjango",
						"edge",
						"eelixir", -- vim ft
						"elixir",
						"ejs",
						"erb",
						"eruby", -- vim ft
						"gohtml",
						"gohtmltmpl",
						"haml",
						"handlebars",
						"hbs",
						"html",
						"htmlangular",
						"html-eex",
						"heex",
						"jade",
						"leaf",
						"liquid",
						"markdown",
						"mdx",
						"mustache",
						"njk",
						"nunjucks",
						"php",
						"razor",
						"slim",
						"twig",
						-- css
						"css",
						"less",
						"postcss",
						"sass",
						"scss",
						"stylus",
						"sugarss",
						-- js
						"javascript",
						"javascriptreact",
						"reason",
						"rescript",
						"typescript",
						"typescriptreact",
						-- mixed
						"vue",
						"svelte",
						"templ",
					},
				})
			end,
		})
	end,
}
