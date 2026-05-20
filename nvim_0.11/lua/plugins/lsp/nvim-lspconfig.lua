return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"folke/snacks.nvim",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		setup = {},
		servers = {
			-- configuration for all lsp servers
			["*"] = {
				capabilities = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				},
			},
			lua_ls = {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "Snacks" } },
						telemetry = { enable = false },
					},
				},
			},
			html = {
				filetypes = {
					"html",
					"heex",
				},
			},
			ts_ls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
			},
			elixirls = {},
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

				opts.desc = "Run Codelens"
				keymap.set({ "n", "x" }, "<leader>lc", vim.lsp.codelens.run, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)

				opts.desc = "Lsp Info"
				keymap.set("n", "<leader>li", function()
					Snacks.picker.lsp_config()
				end, opts)

				opts.desc = "Signature Help"
				keymap.set("n", "gK", function()
					return vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		local diagnostic_signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		}

		vim.diagnostic.config({
			virtual_text = { prefix = "●", spacing = 4 },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
					[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
					[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
					[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
				focusable = false,
				style = "minimal",
			},
		})
		-- DEPRECATED on 0.12
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		-- inlay hints
		if opts.inlay_hint and opts.inlay_hints.enabled then
			Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buffer)
				if
					vim.api.nvim_buf_is_valid(buffer)
					and vim.bo[buffer].buftype == ""
					and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
				then
					vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
				end
			end)
		end

		-- folds
		if opts.folds and opts.folds.enabled then
			Snacks.util.lsp.on({ method = "textDocument/foldingRange" }, function() end)
		end

		-- code lens
		if opts.codelens and vim.lsp.codelens then
			Snacks.util.lsp.on({ method = "textDocument/codeLens" }, function(buffer)
				vim.lsp.codelens.refresh()
				vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
					buffer = buffer,
					callback = vim.lsp.codelens.refresh,
				})
			end)
		end

		-- diagnostics
		if
			opts.diagnostics
			and type(opts.diagnostics.virtual_text) == "table"
			and opts.diagnostics.virtual_text.prefix == "icons"
		then
			opts.diagnostics.virtual_text.prefix = function(diagnostic)
				local icons = {
					error = "  ",
					warn = "  ",
					info = "  ",
					hint = "  ",
				}

				for d, icon in pairs(icons) do
					if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
						return icon
					end
				end
				return "●"
			end
		end
		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		if opts.capabilities then
			opts.servers["*"] = vim.tbl_deep_extend("force", opts.servers["*"] or {}, {
				capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities),
			})
		end

		if opts.servers["*"] then
			vim.lsp.config("*", opts.servers["*"])
		end

		-- get all the servers that are available through mason-lspconfig
		local have_mason, _ = pcall(require, "mason-lspconfig.nvim")
		local mason_all = have_mason
				and vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
			or {} --[[ @as string[] ]]
		local mason_exclude = {} ---@type string[]

		---@return boolean? exclude automatic setup
		local function configure(server)
			if server == "*" then
				return false
			end
			local sopts = opts.servers[server]
			sopts = sopts == true and {} or (not sopts) and { enabled = false } or sopts

			if sopts.enabled == false then
				mason_exclude[#mason_exclude + 1] = server
				return
			end

			local use_mason = sopts.mason ~= false and vim.tbl_contains(mason_all, server)
			local setup = opts.setup[server] or opts.setup["*"]
			if setup and setup(server, sopts) then
				mason_exclude[#mason_exclude + 1] = server
			else
				vim.lsp.config(server, sopts) -- configure the server
				if not use_mason then
					vim.lsp.enable(server)
				end
			end
			return use_mason
		end

		local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))
		if have_mason then
			require("mason-lspconfig").setup({
				ensure_installed = vim.list_extend(install, {}),
				automatic_enable = { exclude = mason_exclude },
			})
		end
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			vim.lsp.config(server, config)
		end
		--
		vim.lsp.enable({ "elixirls", "lua_ls", "ts_ls", "clangd", "html" })
	end,
}
