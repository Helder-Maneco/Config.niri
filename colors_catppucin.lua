return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Base escura cyberpunk
      transparent_background = false,
      term_colors = true,
      color_overrides = {
        mocha = {
          -- Fundo escuro levemente azulado/grafite (estação do dev)
          base = "#11131f",
          mantle = "#0c0d16",
          crust = "#07080e",

          -- Tons das telas de código e monitores retro
          blue = "#4ba3e3",
          cyan = "#38cda6",
          teal = "#29b6ad",

          -- Tons neon da janela ao fundo
          mauve = "#cba6f7",
          pink = "#f5bde6",
          flamingo = "#f2cdcd",

          -- Destaques do braço mecânico e iluminação
          yellow = "#e5c890",
          peach = "#ef9f76",
          red = "#e78284",
        },
      },
      highlight_overrides = {
        mocha = function(colors)
          return {
            -- Torna os comentários um ciano escuro desbotado (estilo terminal antigo)
            Comment = { fg = "#4a6878", italic = true },
            -- Ajusta a barra de status e divisores
            LineNr = { fg = "#3b4261" },
            CursorLineNr = { fg = colors.yellow, bold = true },
          }
        end,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = { enabled = true },
      },
    })

    -- Aplicar o tema
    vim.cmd.colorscheme("catppuccin")
  end,
}
