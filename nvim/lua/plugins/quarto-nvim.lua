-- -- ================================================================================================
-- -- TITLE : quarto-nvim
-- -- LINKS :
-- --   > github : https://github.com/quarto-dev/quarto-nvim
-- -- ABOUT : Quarto mode for Neovim.
-- -- ================================================================================================

return {
	{
		"quarto-dev/quarto-nvim",
		opts = {},
		dependencies = {
			"jmbuhr/otter.nvim",
			opts = {},
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
