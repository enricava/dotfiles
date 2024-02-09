return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup()
			local map = require("helpers.keys").map
            map(
				{ "n", "v" },
				"<C-e>",
				"<cmd>NeoTreeRevealToggle<cr>",
				"Toggle file explorer"
			)
		end,
	},
}
