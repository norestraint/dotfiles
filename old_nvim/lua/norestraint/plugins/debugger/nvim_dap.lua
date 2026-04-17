return {
	"mfussenegger/nvim-dap",
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")

		dapui.setup({})
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})

		dap_python.setup("$HOME/.pyenv/versions/3.11.11/bin/python3.11")

		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "DiagnosticSignWarn",
			linehl = "Visual",
			numhl = "DiagnosticSignWarn",
		})

		-- Automatically open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		local function opts(desc)
			return {
				noremap = true,
				silent = true,
				desc = desc,
			}
		end

		local keymap = vim.keymap

		keymap.set("n", "<localleader>b", function()
			dap.toggle_breakpoint()
		end, opts("Toggle breakpoint"))

		keymap.set("n", "<localleader>c", function()
			dap.continue()
		end, opts("Continue/Start"))

		keymap.set("n", "<localleader>o", function()
			dap.step_over()
		end, opts("Step over"))

		keymap.set("n", "<localleader>i", function()
			dap.step_into()
		end, opts("Step into"))

		keymap.set("n", "<localleader>O", function()
			dap.step_out()
		end, opts("Step out"))

		keymap.set("n", "<localleader>q", function()
			dap.terminate()
		end, opts("Terminate debugging."))

		keymap.set("n", "<localleader>u", function()
			dapui.toggle()
		end, opts("Toggle DAP UI"))
	end,
}
