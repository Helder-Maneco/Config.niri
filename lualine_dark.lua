return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = {
					normal = {
						a = { fg = "#000000", bg = "#e0e0e0", gui = "bold" }, -- Destaque Normal (Cinza Claro / Bright4)
						b = { fg = "#ffffff", bg = "#333333" }, -- Fundo de Seleção (Bright0)
						c = { fg = "#d1d1d1", bg = "#000000" }, -- Fundo do Terminal (#000000)
					},
					insert = {
						a = { fg = "#000000", bg = "#ffffff", gui = "bold" }, -- Destaque Inserção (Branco Puro / Bright5)
						b = { fg = "#ffffff", bg = "#333333" },
						c = { fg = "#d1d1d1", bg = "#000000" },
					},
					visual = {
						a = { fg = "#000000", bg = "#c5c5c5", gui = "bold" }, -- Destaque Visual (Bright3)
						b = { fg = "#ffffff", bg = "#333333" },
						c = { fg = "#d1d1d1", bg = "#000000" },
					},
					replace = {
						a = { fg = "#000000", bg = "#666666", gui = "bold" }, -- Destaque Substituição (Bright1)
						b = { fg = "#ffffff", bg = "#333333" },
						c = { fg = "#d1d1d1", bg = "#000000" },
					},
					inactive = {
						a = { fg = "#555555", bg = "#000000" }, -- Texto Desativado (Regular1)
						b = { fg = "#555555", bg = "#000000" },
						c = { fg = "#555555", bg = "#000000" },
					},
				},
			},
		},
	},
}
