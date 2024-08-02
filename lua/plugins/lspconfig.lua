return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls",
					"bashls", "clangd", "cmake",
					"cssls", "dockerls", "diagnosticls",
					"eslint", "gopls", "html", "jsonls",
					"tsserver", "autotools_ls", "marksman",
					"pyright", "rust_analyzer", "tailwindcss", }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})

			lspconfig.tsserver.setup({})
			lspconfig.clangd.setup({
				cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
				capabilities = capabilities
			})
			lspconfig.gopls.setup({
				capabilities = capabilities
			})
			lspconfig["html"].setup({
				capabilities = capabilities
			})
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				filetypes = { 'html', 'css' }
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { 'python' }
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
				filetypes = { 'dockerfile' }
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		dependencies = "hrsh7th/cmp-nvim-lsp",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.g.rustaceanvim = {
				server = {
					capabilities = capabilities
				}
			}
		end
	},
	{
		'saecki/crates.nvim',
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require('crates')
			crates.setup(opts)
			crates.show()
		end,
	},
}
