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
}
