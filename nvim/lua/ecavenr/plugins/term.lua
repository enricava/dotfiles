return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  keys = {
    { "<C-w>t", "<CMD>ToggleTerm size=80 direction=vertical<CR>", "Toggle terminal",          mode = "n" },
    { "<C-t>",  "<CMD>ToggleTerm size=160 direction=float<CR>",   "Toggle floating terminal", mode = "n" },
    { "<C-t>",  "<CMD>ToggleTerm<CR>",                            "Toggle floating terminal", mode = "t" },
    { "<C-w>t", "<C-\\><C-n>",                                    "Unfocus terminal",         mode = "t" },
  },
}
