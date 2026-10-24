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
                        a = { fg = "#0a0400", bg = "#f5b870", gui = "bold" }, -- Âmbar Brilhante
                        b = { fg = "#f5b870", bg = "#210f00" },             -- Âmbar Escuro / Hover
                        c = { fg = "#9e6c00", bg = "#0a0400" },             -- Âmbar Principal no Fundo Escuro
                    },
                    insert = {
                        a = { fg = "#0a0400", bg = "#ffcca0", gui = "bold" }, -- Âmbar Claro/Abrasivo
                        b = { fg = "#ffcca0", bg = "#210f00" },
                        c = { fg = "#9e6c00", bg = "#0a0400" },
                    },
                    visual = {
                        a = { fg = "#0a0400", bg = "#d27c00", gui = "bold" }, -- Âmbar Médio Dourado
                        b = { fg = "#d27c00", bg = "#210f00" },
                        c = { fg = "#9e6c00", bg = "#0a0400" },
                    },
                    replace = {
                        a = { fg = "#0a0400", bg = "#8c4e12", gui = "bold" }, -- Âmbar Profundo
                        b = { fg = "#8c4e12", bg = "#210f00" },
                        c = { fg = "#9e6c00", bg = "#0a0400" },
                    },
                    inactive = {
                        a = { fg = "#522800", bg = "#0a0400" },             -- Âmbar Apagado
                        b = { fg = "#522800", bg = "#0a0400" },
                        c = { fg = "#522800", bg = "#0a0400" },
                    },
                },
            },
        },
    },
}
