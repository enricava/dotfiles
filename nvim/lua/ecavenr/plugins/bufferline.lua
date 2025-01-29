return {
  -- See current buffers at the top of the editor
  {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = true,
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          buffer_close_icon = '',
          separator_style = { '', '' },
          tab_size = 3,
        },
      })
    end
  },

  -- Highlight similar words and current line
  {
    "yamatsum/nvim-cursorline",
    event = 'VeryLazy',
    opts = {
      cursorline = {
        enable = false,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
}
