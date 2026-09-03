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
                        a = { fg = "#05050A", bg = "#B0B8C0", gui = "bold" },
                        b = { fg = "#B0B8C0", bg = "#1E1E24" },
                        c = { fg = "#5A5A5A", bg = "#0D0D10" },
                    },
                    insert = {
                        a = { fg = "#05050A", bg = "#E8E8E8", gui = "bold" },
                        b = { fg = "#B0B8C0", bg = "#1E1E24" },
                        c = { fg = "#5A5A5A", bg = "#0D0D10" },
                    },
                    visual = {
                        a = { fg = "#05050A", bg = "#8A8A8A", gui = "bold" },
                        b = { fg = "#B0B8C0", bg = "#1E1E24" },
                        c = { fg = "#5A5A5A", bg = "#0D0D10" },
                    },
                    replace = {
                        a = { fg = "#05050A", bg = "#C8CDD2", gui = "bold" },
                        b = { fg = "#B0B8C0", bg = "#1E1E24" },
                        c = { fg = "#5A5A5A", bg = "#0D0D10" },
                    },
                    inactive = {
                        a = { fg = "#3A3A3A", bg = "#0D0D10" },
                        b = { fg = "#3A3A3A", bg = "#0D0D10" },
                        c = { fg = "#3A3A3A", bg = "#0D0D10" },
                    },
                },
            },
        },
    },
}
