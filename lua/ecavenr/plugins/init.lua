return {
    -- Nice theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- load at startup
        priority = 1000, -- before other plugins
        config = function ()
            -- load colorscheme
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- Nice diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- default settings
        },
    },
}
