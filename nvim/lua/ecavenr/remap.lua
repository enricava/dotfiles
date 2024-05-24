vim.g.mapleader = " "

-- Custom remaps
local map = require("ecavenr.keys").map

map("n", "<leader>nh", "<cmd>:noh<cr>", "Remove search highlight")

map("n", "<C-h>", "<C-W>h", "Switch window left")
map("n", "<C-j>", "<C-W>j", "Switch window down")
map("n", "<C-k>", "<C-W>k", "Switch window up")
map("n", "<C-l>", "<C-W>l", "Switch window right")
