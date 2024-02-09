-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
        config = function()
            local map = require("helpers.keys").map
            map("n", "<S-h>", "<CMD>BufferLineCycleNext<CR>", "Next buffer/tab")
            map("n", "<S-l>", "<CMD>BufferLineCyclePrev<CR>", "Previous buffer/tab")
        end
    },
}
