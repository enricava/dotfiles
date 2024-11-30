local map = require("ecavenr.keys").map
map("n", "<leader>w", "<cmd>WinShift<cr>", "Start winshift mode")

return {
  'sindrets/winshift.nvim',
  event = "VeryLazy",
  opts = {
    keymaps = {
      disable_defaults = false,
      win_move_mode = {},
    },
  },

}
