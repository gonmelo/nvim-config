return {
	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend", -- "skip" seems to cause the spawning error
			})
		end,
	},
	-- Mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "jsonls", "marksman", "pyright" },
			})
		end,
	},
	-- Neovim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.clangd.setup({
        capabilities = capabilities
      })
			lspconfig.jsonls.setup({
        capabilities = capabilities
      })
			lspconfig.marksman.setup({
        capabilities = capabilities
      })
			lspconfig.pyright.setup({
        capabilities = capabilities
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
