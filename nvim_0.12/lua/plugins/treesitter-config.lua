local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
	vim.notify("Unable to load nvim-treesitter")
	return {}
end

local setup_treesitter = function()
	treesitter.setup({})
	local ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"elixir",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"rust",
		"svelte",
		"vim",
		"vimdoc",
	}

	local ok_install, installed = pcall(require("nvim-treesitter").get_installed)
	local already_installed = ok_install and installed or {}

	local parsers_to_install = {}
	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		require("nvim-treesitter").install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			local lang = args.match
			if vim.list_contains(treesitter.get_installed(), lang) then
				vim.treesitter.start(args.buf, lang)
			end
		end,
	})
end

setup_treesitter()

local ok, treesitter_context = pcall(require, "treesitter-context")
if not ok then
	vim.notify("Unable to load nvim-treesitter-context")
	return {}
end

treesitter_context.setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		default = {
			"class",
			"function",
			"method",
		},
	},
})
