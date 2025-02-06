local function grep_selection()
  require("telescope-live-grep-args.shortcuts").grep_visual_selection()
end

local function grep_word_under_cursor()
  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
end

return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",

    keys = {
      -- Files and buffers
      { "<leader>fa", "<CMD>Telescope find_files<CR>",                    desc = "Find all files",                        mode = "n" },
      { "<leader>ff", "<CMD>Telescope git_files<CR>",                     desc = "Find in git files",                     mode = "n" },
      { "<leader>fo", "<CMD>Telescope oldfiles<CR>",                      desc = "Find recent files",                     mode = "n" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>",                       desc = "Show open buffers",                     mode = "n" },

      -- Others
      { "<leader>fr", "<CMD>Telescope lsp_references<CR>",                desc = "LSP References",                        mode = "n" },
      { "<leader>cc", "<CMD>Telescope colorscheme<CR>",                   desc = "Change colorscheme",                    mode = "n" },
      { "<leader>tm", "<CMD>Telescope marks<CR>",                         desc = "Find marks",                            mode = "n" },
      { "<leader>fl", "<CMD>Telescope flutter commands<CR>",              desc = "Show flutter commands",                 mode = "n" },

      { "<C-f>",      "<CMD>Telescope live_grep_args live_grep_args<CR>", desc = "Live grep (with args)",                 mode = "n" },
      { "<C-f>",      grep_selection,                                     desc = "Live grep visual selection(with args)", mode = "v" },
      { "<leader>fc", grep_word_under_cursor,                             desc = "Live grep word (withargs)",             mode = "n" },
    },

    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },

    config = function()
      require("telescope").setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          layout_strategy = 'flex',
          cache_picker = {
            num_pickers = 4,
            ignore_empty_prompt = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      })
      -- Telescope extensions
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('flutter')
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<CMD>TodoTelescope<CR>", desc = "Find todos", mode = "n" }
    },
    opts = {},
  }

}
