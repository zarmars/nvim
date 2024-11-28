return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		{ "williamboman/mason.nvim", build = ":MasonUpdate", },
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", },
			automatic_installation = true,
		})
    require("mason-null-ls").setup({
      ensure_installed = {"black"}
    })
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
      },
    })
	end
}
