local map = vim.api.nvim_set_keymap
local nr = { noremap = true }
local snr = { noremap = true, silent = true }

-- map the leader key
map("n", "<Space>", "<NOP>", snr)
vim.g.mapleader = " "

-- Exit insert mode
map("i", "jk", "<Esc>", nr)
map("i", "kj", "<Esc>", nr)

-- Shortcut for save
map("n", "<C-s>", "<cmd>w<CR>", nr)

map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })
