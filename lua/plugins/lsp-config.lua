return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim"},
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pylsp" },
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.lsp.config("pylsp", {
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {enabled = false },
							pyflakes = { enabled = false },
							flake8 = { enabled = true },
							black = { enabled = true },
							isort = { enabled = true },
						},
					},
				},

			})
			vim.lsp.enable("pylsp")
			-- Auto run black, lint and isort on save for python buffer
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.py",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
			-- Manual format python buffer
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "Format Python buffer" })

			vim.keymap.set("n", "<leader>ll", function()
				vim.diagnostic.setloclist()
			end, { desc = "Show linting diagnostics" })

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = {"vim"}}
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- General LSP keymaps
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "LSP hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition of symbol under cursor" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of symbol under cursor" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "List all implementations of symbol under cursor" })

			-- Diagnostics keymaps
			vim.keymap.set("n", "<leader>H", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
			vim.keymap.set("n", "gN", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>ah", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

			-- Code Actions
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions"})

			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					})
				end,
			})

			-- Inline diagnostics
			vim.diagnostic.config({
				virtual_text = {
					prefix = "■",  -- could also try "●", "▎", "■"
					spacing = 2,
					source = "if_many", -- show source name only if multiple LSPs
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
				},
			})

			-- Gutter icons
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},
}
