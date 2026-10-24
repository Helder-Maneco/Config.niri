return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          -- 1. MUDANÇA CRÍTICA: "thin" remove os triângulos e usa linhas finas
          separator_style = "thin", 
          offsets = {
            {
              filetype = "NvimTree",
              text = "Files",
              text_align = "left",
              separator = false, -- Removido para evitar a linha vertical sólida
            }
          },
          show_buffer_close_icons = false,
          show_close_icon = false,
        },
        -- 2. FORÇANDO A TRANSPARÊNCIA (O Bloco de Elite)
        highlights = {
          fill = {
            bg = 'NONE', -- Deixa o fundo da barra transparente
          },
          background = {
            bg = 'NONE', -- Deixa as abas inativas transparentes
          },
          buffer_selected = {
            bg = 'NONE', -- Deixa a aba aberta transparente
            bold = true,
            italic = true,
          },
          separator = {
            bg = 'NONE',
            fg = '#3b4252', -- Uma cor discreta para a linha divisória
          },
          separator_selected = {
            bg = 'NONE',
          },
          offset_separator = {
            bg = 'NONE',
          },
        }
      })
    end,
  },
}
