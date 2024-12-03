return {
  'sindrets/winshift.nvim',
  event = "VeryLazy",
  keys = {
    { "<leader>w", "<cmd>WinShift<cr>", desc = "Start winshift mode", mode = "n" },
  },
  opts = {
    keymaps = {
      disable_defaults = false,
      win_move_mode = {},
    },
  },

}
