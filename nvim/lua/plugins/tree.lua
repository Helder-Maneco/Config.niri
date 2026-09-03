return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      -- 1. Visualização de Elite
      view = {
        width = 30,
        side = "left",
      },
      -- 2. Renderização (Ajuste de compatibilidade)
      renderer = {
        -- No NvimTree moderno, usamos root_folder_label para limpar o topo
        root_folder_label = false, 
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      -- 3. Filtros (Escondendo os .files)
      filters = {
        dotfiles = true,
        custom = { "^\\.git$" }, -- Garante que o .git também suma
      },
    })
  end,
}
