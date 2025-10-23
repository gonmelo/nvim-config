return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", 
	},
	lazy = false, 
	config = function()
		require("neo-tree").setup({
			enable_git_status = true,
		})
		vim.keymap.set("n", "<leader>x", ":Neotree toggle<CR>")
	end
}
