local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                theme = "wave",
                background = { dark = "wave" },
            })
            vim.cmd.colorscheme "kanagawa-wave"
            enable_transparency()

            -- corrige netrw
            vim.api.nvim_set_hl(0, "netrwDir",      { fg = "#B0B8C0" })
            vim.api.nvim_set_hl(0, "netrwClassify", { fg = "#5A5A5A" })
            vim.api.nvim_set_hl(0, "netrwLink",     { fg = "#8A8A8A" })
            vim.api.nvim_set_hl(0, "netrwSymLink",  { fg = "#8A8A8A" })
            vim.api.nvim_set_hl(0, "netrwExe",      { fg = "#E8E8E8", bold = true })
            vim.api.nvim_set_hl(0, "netrwComment",  { fg = "#3A3A3A", italic = true })
            vim.api.nvim_set_hl(0, "netrwList",     { fg = "#5A5A5A" })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "kanagawa",
        }
    },
}
