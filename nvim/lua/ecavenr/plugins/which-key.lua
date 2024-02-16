return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register(
                {
                    ["<leader>"] = {
                        g = { name = "Git" },
                        c = { name = "LSP Stuff" },
                        f = { name = "Telescope" },
                        t = { name = "Trouble" },
                    },
                }
            )
        end
    }
}
