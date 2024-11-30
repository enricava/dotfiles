vim.g.mapleader = " "
vim.g.maplocalleader = ','

-- Custom remaps
local map = require("ecavenr.keys").map

map("n", "<leader>nh", "<cmd>:noh<cr>", "Remove search highlight")

-- Window switching
map("n", "<C-h>", "<C-W>h", "Switch window left")
map("n", "<C-j>", "<C-W>j", "Switch window down")
map("n", "<C-k>", "<C-W>k", "Switch window up")
map("n", "<C-l>", "<C-W>l", "Switch window right")

-- Select all with Ctrl+A
map("n", "<C-a>", "gg<S-v>G", "Select all")

-- Save with Ctrl+S
map({'n', 'v', 'i'}, "<C-s>", "<Esc>:w<CR>", "Save file")

-- Exit with Alt+4
map("n", "<A-4>", ":q<CR>", "Exit vim")

-- Open Mason
map("n", "<leader>m", "<cmd>:Mason<cr>", "Open Mason")

-- Cycle buffers
map("n", "<S-x>", "<CMD>bd<CR>", "Close current buffer")
map("n", "<S-l>", "<CMD>bnext<CR>", "Next buffer/tab")
map("n", "<S-h>", "<CMD>bprev<CR>", "Previous buffer/tab")
map("n", "<S-c>", ":%bd|e#|bd#<CR>", "Close all other buffers")
