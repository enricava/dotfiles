return {
    -- Favorite theme
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,    -- load at startup
        priority = 1000, -- before other plugins
        config = function()
            require("kanagawa").setup({
                transparent = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                }
            })
            vim.cmd([[colorscheme kanagawa-wave]])
        end,
    },
}
