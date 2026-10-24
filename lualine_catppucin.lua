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
						a = { fg = "#07080e", bg = "#38cda6", gui = "bold" }, -- Ciano neon da tela
						b = { fg = "#38cda6", bg = "#18202a" }, -- Ciano médio / Fundo escuro
						c = { fg = "#4ba3e3", bg = "#11131f" }, -- Azul nos textos da barra
					},
					insert = {
						a = { fg = "#07080e", bg = "#e5c890", gui = "bold" }, -- Dourado do braço robótico
						b = { fg = "#e5c890", bg = "#25201b" },
						c = { fg = "#4ba3e3", bg = "#11131f" },
					},
					visual = {
						a = { fg = "#07080e", bg = "#cba6f7", gui = "bold" }, -- Roxo/Magenta da janela neon
						b = { fg = "#cba6f7", bg = "#22192b" },
						c = { fg = "#4ba3e3", bg = "#11131f" },
					},
					replace = {
						a = { fg = "#07080e", bg = "#e78284", gui = "bold" }, -- Vermelho/Coral retro
						b = { fg = "#e78284", bg = "#26191c" },
						c = { fg = "#4ba3e3", bg = "#11131f" },
					},
					inactive = {
						a = { fg = "#4a6878", bg = "#11131f" }, -- Azul apagado / Inativo
						b = { fg = "#4a6878", bg = "#11131f" },
						c = { fg = "#4a6878", bg = "#07080e" },
					},
				},
			},
		},
	},
}
