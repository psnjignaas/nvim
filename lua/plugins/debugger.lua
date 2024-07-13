return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debugger break point" })
			vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "debugger break point" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {
			handlers = {},
			ensure_installed={"codelldb"}
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	}
}
