return {
  'sindrets/winshift.nvim',
  config = function()
    require('winshift').setup({
      keymaps = {
        disable_defaults = false,
        win_move_mode = {
          -- Example custom config
          -- ["<S-left>"] = "left",
        },
      }
    })
    local map = require("ecavenr.keys").map

    map("n", "<leader>w","<cmd>WinShift<cr>", "Start winshift mode")

  end
}
