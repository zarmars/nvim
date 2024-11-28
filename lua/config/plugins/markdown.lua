return {
	{
		"instant-markdown/vim-instant-markdown",
    lazy = true,
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_autostart = 0
		end,
	},
}
