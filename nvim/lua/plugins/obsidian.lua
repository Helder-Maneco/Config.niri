return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    event = {
      "BufReadPre " .. vim.fn.expand("~/Obsidian-Vault") .. "/**.md",
      "BufNewFile " .. vim.fn.expand("~/Obsidian-Vault") .. "/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Nova nota" },
      { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Abrir no Obsidian app" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Procurar notas" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Ver backlinks" },
      { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Ver tags" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Nota diária" },
      {
        "gf",
        function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<cr>"
          else
            return "gf"
          end
        end,
        noremap = false,
        expr = true,
        ft = "markdown",
      },
    },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Obsidian-Vault",
        },
      },
      daily_notes = {
        folder = "diario",
        date_format = "%Y-%m-%d",
      },
      completion = {
        nvim_cmp = true, -- muda para false se não usares nvim-cmp
        min_chars = 2,
      },
      note_id_func = function(title)
        return title and title:gsub(" ", "-"):lower() or tostring(os.time())
      end,
      ui = {
        enable = true,
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    opts = {},
  },
}
