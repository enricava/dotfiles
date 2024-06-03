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
                    "cpp",
                    "lua",
                    "vim",
                    "python",
                    "vimdoc",
                    "query",
                    "elixir",
                    "heex",
                    "javascript",
                    "java",
                    "html",
                    "rust"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- Automatic pair closing
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Remove spaces to the right, but only on modified lines
    {
        "thirtythreeforty/lessspace.vim"
    },
}
