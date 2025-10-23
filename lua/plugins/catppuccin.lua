return { 
	"catppuccin/nvim", 
	name = "catppuccin", 
	lazy = false, 
	priority = 1000, 
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				telescope = true,
			},
		})
		vim.cmd.colorscheme "catppuccin-mocha"
	end,
}
