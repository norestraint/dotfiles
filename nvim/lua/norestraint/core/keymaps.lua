vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

-- others
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit file" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- movements
-- keymap.set("n", "<leader><Esc>", vim.cmd.Ex, { desc = "Go to explorer" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Moves up and keeps the cursor on the middle of the screen" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Moves down and keeps the cursor on the middle of the screen" })
keymap.set("i", "<C-h>", "<Left>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Use vim keybinds as arrow keys in insert mode" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Use vim keybinds as arrow keys in insert mode" })

-- visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text up a line" })
keymap.set("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move selected text down a line" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

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
