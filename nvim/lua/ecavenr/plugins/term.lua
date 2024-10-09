return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup({
      })
      local map = require("ecavenr.keys").map

      map("n", "<C-w>t", "<CMD>ToggleTerm size=80 direction=vertical<CR>", "Toggle terminal")
      map("n", "<C-t>", "<CMD>ToggleTerm size=160 direction=float<CR>", "Toggle floating terminal")
      map("t", "<C-t>", "<CMD>ToggleTerm<CR>", "Toggle floating terminal")
      map("t", "<C-w>t", "<C-\\><C-n>", "Unfocus terminal")
    end
  }
}
