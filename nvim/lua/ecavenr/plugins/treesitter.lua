return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local install = require("nvim-treesitter.install")
            install.compilers = { "clang" }

            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "heex",
                    "javascript",
                    "html",
                    "rust"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-treesitter/playground"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        -- Commenting, like gcc and gc
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    {
        "thirtythreeforty/lessspace.vim"
    },
}
