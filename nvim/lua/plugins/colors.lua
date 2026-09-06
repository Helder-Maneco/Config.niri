-- Lualine customizada Noir City (fundo escuro sólido)
local noircity_lualine_theme = {
    normal = {
        a = { fg = "#0f0f0f", bg = "#ffffff", bold = true },
        b = { fg = "#ffffff", bg = "#1f1f1f" },
        c = { fg = "#dcd7ba", bg = "#0f0f0f" },
    },
    insert = {
        a = { fg = "#0f0f0f", bg = "#e0e0e0", bold = true },
        b = { fg = "#e0e0e0", bg = "#1f1f1f" },
        c = { fg = "#dcd7ba", bg = "#0f0f0f" },
    },
    visual = {
        a = { fg = "#0f0f0f", bg = "#c5c5c5", bold = true },
        b = { fg = "#c5c5c5", bg = "#1f1f1f" },
        c = { fg = "#dcd7ba", bg = "#0f0f0f" },
    },
    replace = {
        a = { fg = "#0f0f0f", bg = "#a0a0a0", bold = true },
        b = { fg = "#a0a0a0", bg = "#1f1f1f" },
        c = { fg = "#dcd7ba", bg = "#0f0f0f" },
    },
    command = {
        a = { fg = "#0f0f0f", bg = "#b8b8b8", bold = true },
        b = { fg = "#b8b8b8", bg = "#1f1f1f" },
        c = { fg = "#dcd7ba", bg = "#0f0f0f" },
    },
    inactive = {
        a = { fg = "#555555", bg = "#0f0f0f" },
        b = { fg = "#555555", bg = "#0f0f0f" },
        c = { fg = "#555555", bg = "#0f0f0f" },
    },
}

return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = false, -- Transparência desativada
                theme = "lotus",      -- Opções: wave, dragon, lotus
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg = "#0f0f0f",        -- Fundo sólido principal
                                bg_gutter = "#0f0f0f", -- Fundo dos números de linha
                            }
                        }
                    }
                },
                overrides = function(colors)
                    return {
                        Normal      = { bg = "#0f0f0f" },
                        NormalNC    = { bg = "#0f0f0f" },
                        NormalFloat = { bg = "#1f1f1f" },

                        -- UI e Bordas sólidas
                        LineNr       = { fg = "#555555", bg = "#0f0f0f" },
                        CursorLineNr = { fg = colors.theme.syn.fun, bg = "#0f0f0f", bold = true },
                        WinSeparator = { fg = "#2b2b2b" },
                        SignColumn   = { bg = "#0f0f0f" },

                        -- Popups e Menus
                        FloatBorder = { fg = "#e0e0e0", bg = "#1f1f1f" },
                        Pmenu       = { fg = "#dcd7ba", bg = "#1f1f1f" },
                        PmenuSel    = { fg = "#0f0f0f", bg = "#ffffff", bold = true },

                        -- Busca
                        Search    = { fg = "#0f0f0f", bg = "#2d4f67" },
                        IncSearch = { fg = "#0f0f0f", bg = "#ffa066", bold = true },
                    }
                end,
            })
            vim.cmd.colorscheme "kanagawa"

            -- Netrw estilizado com cores Kanagawa
            vim.api.nvim_set_hl(0, "netrwDir",      { fg = "#7e9cd8", bold = true })
            vim.api.nvim_set_hl(0, "netrwClassify", { fg = "#727169" })
            vim.api.nvim_set_hl(0, "netrwLink",     { fg = "#7fb4ca" })
            vim.api.nvim_set_hl(0, "netrwSymLink",  { fg = "#7fb4ca" })
            vim.api.nvim_set_hl(0, "netrwExe",      { fg = "#98bb6c", bold = true })
            vim.api.nvim_set_hl(0, "netrwComment",  { fg = "#727169", italic = true })
            vim.api.nvim_set_hl(0, "netrwList",     { fg = "#dcd7ba" })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = noircity_lualine_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true, -- Barra única compartilhada
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return ' ' .. str end } },
                lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { { 'location', icon = '' } },
            },
        },
    },
}
