return {
  -- See current buffers at the top of the editor
  {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          -- mode = "tabs",
          -- show_buffer_close_icons = false,
          -- show_close_icon = false,
          diagnostics = "nvim_lsp",
          separator_style = { "", "" }
        },
      })

      local map = require("ecavenr.keys").map
      map("n", "<S-x>", "<CMD>bd<CR>", "Close current buffer")
      map("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", "Next buffer/tab")
      map("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", "Previous buffer/tab")
    end
  },

  -- Highlight similar words and current line
  {
    "yamatsum/nvim-cursorline",
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
      }
    end
  }
}
