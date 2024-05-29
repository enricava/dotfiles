return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup()
      local map = require("ecavenr.keys").map
      -- Telescope mappings
      map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find all files")
      map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", "Live grep")
      map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", "Buffers")
      map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", "Help tags")
      map("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", "Find recent files")

      -- LSP remaps
      map("n", "<leader>fr", "<CMD>Telescope lsp_references<CR>", "LSP References")
      map("n", "<leader>fd", "<CMD>Telescope lsp_definitions<CR>", "LSP Definitions")
      map("n", "<leader>fw", "<CMD>Telescope lsp_workspace_symbols<CR>", "LSP Workspace symbols")
    end

  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("todo-comments").setup()
      local map = require("ecavenr.keys").map

      map("n", "<leader>ft", "<CMD>TodoTelescope<CR>", "Find todos")
    end
  }

}
