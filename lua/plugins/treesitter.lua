return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {
				"c",
				"lua",
				"python",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline"
			},
			sync_install = false,
			auto_install = true,
			ignore_install = { "javascript" },
			highlight = { enable = true },
			indent = { enable = true },
		}
	end,
}
