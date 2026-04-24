vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

-- others
keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Exit file" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>fo", "gggqG", { desc = "Format file" })
keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
keymap.set("n", "<leader>cR", "<CMD>mksession! Session.vim | restart source Session.vim<CR>", { desc = "Restart config(keeps state)" })

keymap.set("n", "<leader><esc>", "<CMD>Ex<CR>", { desc = "Go back to filetree" })

-- movements

keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

keymap.set("n", "n", "nzzzv", { desc = "Centers mouse after going to next search result" })
keymap.set("n", "N", "Nzzzv", { desc = "Centers mouse after going to previous search result" })

keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Moves up and keeps the cursor on the middle of the screen" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Moves down and keeps the cursor on the middle of the screen" })
keymap.set("n", "G", "Gzz", { desc = "Moves to end of file and keeps the cursor on the middle of the screen" })

keymap.set("i", "<C-h>", "<Left>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Use vim keybinds as arrow keys in insert mode" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the pane on the left on normal mode" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the pane on the right on normal mode" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the pane above on normal mode" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the pane below on normal mode" })

-- visual mode
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })
keymap.set("v", "x", '"_d', { desc = "Delete without yanking" })

keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- buffers management
keymap.set("n", "L", "<CMD>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "H", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bc", "<CMD>bdelete<CR>", { desc = "Closes current buffer" })
keymap.set("n", "<leader>bo", "<CMD>%bdelete|e#<CR>", { desc = "Closes other buffers" })

-- panes management
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make panes equal size" })
keymap.set("n", "<leader>pc", ":close<CR>", { desc = "Close current pane" })

-- tabs management
keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>th", ":tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>to", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

return {}
