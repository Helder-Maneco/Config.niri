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
                        a = { fg = "#0f0f0f", bg = "#ffffff", gui = "bold" }, -- Branco Puro (Destaque Principal)
                        b = { fg = "#ffffff", bg = "#1f1f1f" },             -- Cinza Escuro de Fundo
                        c = { fg = "#d1d1d1", bg = "none" },                -- Transparente com Texto Claro
                    },
                    insert = {
                        a = { fg = "#0f0f0f", bg = "#e0e0e0", gui = "bold" }, -- Cinza Muito Claro
                        b = { fg = "#e0e0e0", bg = "#1f1f1f" },
                        c = { fg = "#d1d1d1", bg = "none" },
                    },
                    visual = {
                        a = { fg = "#0f0f0f", bg = "#c5c5c5", gui = "bold" }, -- Prata Médio
                        b = { fg = "#c5c5c5", bg = "#1f1f1f" },
                        c = { fg = "#d1d1d1", bg = "none" },
                    },
                    replace = {
                        a = { fg = "#0f0f0f", bg = "#a0a0a0", gui = "bold" }, -- Cinza Intermediário
                        b = { fg = "#a0a0a0", bg = "#1f1f1f" },
                        c = { fg = "#d1d1d1", bg = "none" },
                    },
                    inactive = {
                        a = { fg = "#555555", bg = "none" },                -- Cinza Apagado
                        b = { fg = "#555555", bg = "none" },
                        c = { fg = "#555555", bg = "none" },
                    },
                },
            },
        },
    },
}
