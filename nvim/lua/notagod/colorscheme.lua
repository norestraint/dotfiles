function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


end

ColorMyPencils("catppuccin-mocha")

vim.cmd "highlight SignColumn ctermbg=none guibg=none"
vim.cmd "highlight TelescopeBorder ctermbg=none guibg=none"
vim.cmd "highlight Normal ctermbg=none guibg=none"
vim.cmd "highlight NormalNC ctermbg=none guibg=none"
vim.cmd "highlight MsgArea ctermbg=none guibg=none"
vim.cmd "highlight NvimTreeNormal ctermbg=none guibg=none"
vim.cmd "let &fcs='eob: '"

