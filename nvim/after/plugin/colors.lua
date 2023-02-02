function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("tokyonight-night")

-- This needs to be here because it needs to happen after the setting for the theme.
vim.cmd "highlight SignColumn ctermbg=NONE guibg=NONE"
