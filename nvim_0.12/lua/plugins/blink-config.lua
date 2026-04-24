local ok_blink, blink = pcall(require, "blink.cmp")
if not ok_blink then
  vim.notify("Unable to load blink")
  return {}
end

local ok_luasnip, luasnip = pcall(require, "luasnip")
if not ok_luasnip then
  vim.notify("Unable to load LuaSnip")
  return {}
end

luasnip.setup({})

blink.setup({
	keymap = {
		preset = "none",
		["<C-y>"] = { "select_and_accept", "fallback" },

		["<C-Space>"] = { "show" },
		["<C-p>"] = { "show_documentation" },
		["<C-e>"] = { "hide", "fallback" },

		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	}
})
