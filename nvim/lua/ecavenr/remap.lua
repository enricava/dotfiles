vim.g.mapleader = " "

local map = require("ecavenr.keys").map
map("n", "<leader>nh", "<cmd>:noh<cr>", "Remove search highlight")
