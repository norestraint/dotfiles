return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
  },
  config = function()
    local neotest = require("neotest")
    local keymap = vim.keymap

    keymap.set("n", "<localleader>tt", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    keymap.set("n", "<localleader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Run nearest test with debugger" })

    keymap.set("n", "<localleader>tb", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run tests in current file" })

    keymap.set("n", "<localleader>ts", "<CMD>Neotest summary<CR>", { desc = "Show tests summary" })

    neotest.setup(
      {
        adapters = {
          require("neotest-elixir"),
        },
        benchmark = {
          enabled = true
        },
        consumers = {},
        default_strategy = "integrated",
        diagnostic = {
          enabled = true,
          severity = 1
        },
        discovery = {
          concurrent = 0,
          enabled = true
        },
        floating = {
          max_height = 0.6,
          max_width = 0.6,
          options = {}
        },
        highlights = {
          adapter_name = "NeotestAdapterName",
          border = "NeotestBorder",
          dir = "NeotestDir",
          expand_marker = "NeotestExpandMarker",
          failed = "NeotestFailed",
          file = "NeotestFile",
          focused = "NeotestFocused",
          indent = "NeotestIndent",
          marked = "NeotestMarked",
          namespace = "NeotestNamespace",
          passed = "NeotestPassed",
          running = "NeotestRunning",
          select_win = "NeotestWinSelect",
          skipped = "NeotestSkipped",
          target = "NeotestTarget",
          test = "NeotestTest",
          unknown = "NeotestUnknown",
          watching = "NeotestWatching"
        },
        icons = {
          child_indent = "│",
          child_prefix = "├",
          collapsed = "─",
          expanded = "╮",
          failed = "",
          final_child_indent = " ",
          final_child_prefix = "╰",
          non_collapsible = "─",
          notify = "",
          passed = "",
          running = "",
          running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
          skipped = "",
          unknown = "",
          watching = ""
        },
        jump = {
          enabled = true
        },
        log_level = 3,
        output = {
          enabled = true,
          open_on_run = false
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15"
        },
        projects = {},
        quickfix = {
          enabled = true,
          open = false
        },
        run = {
          enabled = true
        },
        running = {
          concurrent = true
        },
        state = {
          enabled = true
        },
        status = {
          enabled = true,
          signs = true,
          virtual_text = false
        },
        strategies = {
          integrated = {
            height = 40,
            width = 120
          }
        },
        summary = {
          animated = true,
          count = true,
          enabled = true,
          expand_errors = true,
          follow = true,
          mappings = {
            attach = "a",
            clear_marked = "M",
            clear_target = "T",
            debug = "d",
            debug_marked = "D",
            expand = { "<CR>", "<2-LeftMouse>" },
            expand_all = "e",
            help = "?",
            jumpto = "i",
            mark = "m",
            next_failed = "J",
            output = "o",
            prev_failed = "K",
            run = "r",
            run_marked = "R",
            short = "O",
            stop = "u",
            target = "t",
            watch = "w"
          },
          open = "botright vsplit | vertical resize 50"
        },
        watch = {
          enabled = true,
          symbol_queries = {}
        }
      }
    )
  end,
}
