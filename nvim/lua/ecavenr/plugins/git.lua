-- Git related plugins
return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local map = require("ecavenr.keys").map
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
                    map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
                    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
                    map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
                    map("n", "<leader>ghb", function() gs.blame_line { full = true } end, "Blame this")
                    map("n", "<leader>ghd", gs.diffthis, "Diff with")
                    map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff with prev")
                    map("n", "<leader>ght", gs.toggle_current_line_blame, "Toggle current line blame")
                    map("n", "<leader>ghx", gs.toggle_deleted, "Toggle deleted")
                    map("n", "<leader>gn", gs.next_hunk, "Next hunk")
                    map("n", "<leader>gp", gs.prev_hunk, "Previus hunk")
                end
            })
        end
    },

    -- Conflict resolution
    {
        "akinsho/git-conflict.nvim",
        commit = "2957f74",
        config = function()
            require("git-conflict").setup({
                default_mappings = {
                    ours = "co",
                    theirs = "ct",
                    none = "c0",
                    both = "cb",
                    next = "cn",
                    prev = "cp",
                },
            })
        end,
    },

    -- Cool history view
    {
        "sindrets/diffview.nvim",
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>",        desc = "Open diff view",         mode = "n" },
            { "<leader>gl", "<cmd>DiffviewFileHistory<cr>", desc = "Open file history view", mode = "n" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>",       desc = "Close diff view",        mode = "n" },
        },
    },
}
