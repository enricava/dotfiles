-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Select all with Ctrl+A
map({ "n", "v" }, "<C-a>", "gg<S-v>G")

-- Exit with Alt+F4
map({ "n", "v" }, "<A-4>", ":q<CR>")
