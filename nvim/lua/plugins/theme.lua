-- Kanagawa
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	italic = true,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			transparent = false,
			background = {
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		})

		vim.cmd("colorscheme kanagawa-wave")
	end,
}

-- Melange
-- return {
-- 	"savq/melange-nvim",
-- 	lazy = false,
-- 	italic = true,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.melange_enable_font_variants = 0 -- disable font variants
-- 		vim.cmd("colorscheme melange")
-- 	end,
-- }

-- Nordic
-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	italic = true,
-- 	priority = 1000,
-- }

-- Sonokai
-- return {
-- 	"sainnhe/sonokai",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.sonokai_enable_italic = true
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }

-- Moonfly
-- return {
-- 	"bluz71/vim-moonfly-colors",
-- 	name = "moonfly",
-- 	lazy = false,
-- 	priority = 1000,
-- }
