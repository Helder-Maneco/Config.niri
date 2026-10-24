return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {
    [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
    [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
    [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
    [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
    [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
    [[                                                        ]],
    [[                  A R C H  -  B A C K E N D             ]],
   }

dashboard.section.header.opts = {
      hl = "AlphaHeader",
      position = "center",
    }
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#FFFFFF" })

    -- Botões
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰍉  Search Files", ":Telescope find_files<CR>"),
      dashboard.button("r", "󰯂  Recent",           ":Telescope oldfiles<CR>"),
      dashboard.button("e", "  New File",        ":ene <BAR> startinsert<CR>"),
      dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
