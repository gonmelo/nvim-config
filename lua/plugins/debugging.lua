return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
      "nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python"
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

      require("dapui").setup()
      require("dap-python").setup("~/AppData/Local/nvim/.virtualenvs/debugpy/Scripts/python")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		end,
	},
}
