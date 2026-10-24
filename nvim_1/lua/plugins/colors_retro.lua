return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "hard",
                palette_overrides = {
                    dark0_hard = "#0a0400", -- Define o fundo principal sólido (sem transparência)
                    dark0 = "#0a0400",
                    dark1 = "#100700",      -- Fundo de superfícies/status
                    dark2 = "#150900",
                },
                overrides = {
                    -- Fundo sólido usando a cor do setup
                    Normal = { bg = "#0a0400" },
                    NormalNC = { bg = "#0a0400" },
                    SignColumn = { bg = "#0a0400" },
                    LineNr = { fg = "#522800" },
                    CursorLine = { bg = "#210f00" },
                    CursorLineNr = { fg = "#f5b870", bold = true },

                    -- Popups e Menus flutuantes sólidos
                    NormalFloat = { bg = "#100700" },
                    FloatBorder = { fg = "#522800", bg = "#100700" },
                    Pmenu = { fg = "#9e6c00", bg = "#100700" },
                    PmenuSel = { fg = "#f5b870", bg = "#210f00", bold = true },

                    -- Divisores de janela
                    WinSeparator = { fg = "#210f00" },
                },
                dim_inactive = false,
                transparent_mode = false, -- Transparência desligada
            })

            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "gruvbox",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", fmt = function(str) return " " .. str end } },
                lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { { "location", icon = "" } },
            },
        },
    },
}
