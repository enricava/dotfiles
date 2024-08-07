return {
  -- See current buffers at the top of the editor
  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "v4.*",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     require("bufferline").setup({
  --       options = {
  --         -- mode = "tabs",
  --         -- show_buffer_close_icons = false,
  --         -- show_close_icon = false,
  --         diagnostics = "nvim_lsp",
  --         separator_style = { "", "" }
  --       },
  --     })
  --
  --   end
  -- },

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
