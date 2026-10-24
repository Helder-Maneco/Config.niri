return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "dragon", -- Opções: "wave", "dragon" (mais escuro)
      background = {
        dark = "wave",
        light = "lotus",
      },
      colors = {
        palette = {
          -- Fundo escuro e profundo
          sumiInk0 = "#07080e",
          sumiInk1 = "#0c0d16",
          sumiInk2 = "#11131f",
          sumiInk3 = "#18202a",
          sumiInk4 = "#2b2c3b",

          -- Tons de azul, ciano e neon
          crystalBlue = "#4ba3e3",
          waveAqua1 = "#38cda6",
          waveAqua2 = "#29b6ad",

          -- Tons de destaque
          oniViolet = "#cba6f7",
          sakuraPink = "#f5bde6",
          carpYellow = "#e5c890",
          surimiOrange = "#ef9f76",
          peachRed = "#e78284",
        },
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        return {
          -- Estilo para os comentários
          Comment = { fg = "#4a6878", italic = true },
          -- Numeração de linhas
          LineNr = { fg = "#3b4261" },
          CursorLineNr = { fg = colors.palette.carpYellow, bold = true },
        }
      end,
    })

    -- Aplicar o tema Kanagawa
    vim.cmd.colorscheme("kanagawa")
  end,
}
