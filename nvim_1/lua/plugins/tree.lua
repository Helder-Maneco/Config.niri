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
      renderer = {
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
