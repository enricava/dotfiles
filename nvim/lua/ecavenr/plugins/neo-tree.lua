return {
    -- "P" to preview files
    "nvim-lua/plenary.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    position = "right"
                },
            })
            local map = require("ecavenr.keys").map
            map(
                { "n", "v" },
                "<leader>ee",
                function()
                    require("neo-tree.command").execute({
                        toggle = true,
                        position = "right",
                    })
                end,
                "Toggle file explorer"
            )
        end,
    },
    --   {"akinsho/toggleterm.nvim", version = "*", config = true}
}
