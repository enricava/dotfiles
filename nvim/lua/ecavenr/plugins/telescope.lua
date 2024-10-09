return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim" ,
    },

    config = function()
      require("telescope").setup({
        defaults = {
          cache_picker = {
            num_pickers = 4,
            ignore_empty_prompt = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      })

      local map = require("ecavenr.keys").map

      -- Telescope mappings
      map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find files")
      map("n", "<leader>fg", "<CMD>Telescope git_files<CR>", "Find in git files")
      map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", "Buffers")

      map("n", "<C-g>", "<CMD>Telescope find_files<CR>", "Find all files")
      map("n", "<C-f>", "<CMD>Telescope live_grep_args live_grep_args<CR>", "Live grep (with args)")

      map("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", "Find recent files")
      map("n", "<leader>fl", "<CMD>Telescope flutter commands<CR>", "Show flutter commands")

      map("n", "<leader>cc", "<CMD>Telescope colorscheme<CR>", "Change colorscheme")

      map("n", "<leader>fh", "<CMD>Telescope pickers<CR>", "Telescope pickers")

      -- LSP remaps
      map("n", "<leader>fr", "<CMD>Telescope lsp_references<CR>", "LSP References")

      local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
      map("v", "<C-f>", live_grep_args_shortcuts.grep_visual_selection, "Live grep visual selection (with args)")
      map("n", "<leader>fc", live_grep_args_shortcuts.grep_word_under_cursor, "Live grep word (with args)")

      -- Telescope extensions
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('flutter')
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
