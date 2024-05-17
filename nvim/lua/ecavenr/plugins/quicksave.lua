return {
    "enricava/quicksave.nvim",
    config = function()
        require('quicksave').setup()
        local map = require("ecavenr.keys").map
        map("n", "<leader>sl", "<CMD>SessionLoad<CR>", "Load previous session")
        map("n", "<leader>ss", "<CMD>SessionSave<CR>", "Save cur session")
    end
}
