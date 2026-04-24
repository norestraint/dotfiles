return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"jfpedroza/neotest-elixir",
		"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
		{
			"fredrikaverpil/neotest-golang",
			version = "*", -- Optional, but recommended; track releases
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
	},
	keys = {
		{
			"<localleader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Show tests summary",
		},
		{
			"<localleader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<localleader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Run nearest test with debugger",
		},
		{
			"<localleader>tb",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run tests in current file",
		},
	},
	opts = {
		benchmark = {
			enabled = true,
		},
		consumers = {},
		output = {
			enabled = true,
			open_on_run = true,
		},
		status = {
			virtual_text = true,
		},
		watch = {
			enabled = false,
			symbol_queries = {},
		},
		quickfix = {
			-- open = function()
			-- 	local has_trouble, trouble = pcall(require, "trouble.nvim")
			-- 	if has_trouble then
			-- 		trouble.open({ model = "quickfix", focus = false })
			-- 	else
			-- 		vim.cmd("copen")
			-- 	end
			-- end,
		},
	},
	config = function(_, opts)
		local neotest = require("neotest")

		local neotest_ls = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s", "")
					return message
				end,
			},
		}, neotest_ls)

		-- local has_trouble, trouble = pcall(require, "trouble.nvim")
		-- if has_trouble then
		-- 	opts.consumers = opts.consumers or {}
		-- 	-- Refresh and auto close trouble after running tests
		-- 	---@type neotest.Consumer
		-- 	opts.consumers.trouble = function(client)
		-- 		client.listeners.results = function(adapter_id, results, partial)
		-- 			if partial then
		-- 				return
		-- 			end
		-- 			local tree = assert(client:get_position(nil, { adapter = adapter_id }))
		--
		-- 			local failed = 0
		-- 			for pos_id, result in pairs(results) do
		-- 				if result.status == "failed" and tree:get_key(pos_id) then
		-- 					failed = failed + 1
		-- 				end
		-- 			end
		-- 			vim.schedule(function()
		-- 				if trouble.is_open() then
		-- 					trouble.refresh()
		-- 					if failed == 0 then
		-- 						trouble.close()
		-- 					end
		-- 				end
		-- 			end)
		-- 			return {}
		-- 		end
		-- 		return {}
		-- 	end
		-- end

		opts["adapters"] = {
			require("neotest-elixir"),
			require("neotest-golang")({
				runner = "gotestsum",
			}),
		}
		neotest.setup(opts)
	end,
}
