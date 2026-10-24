return {
  -- Plugin para cursores múltiplos (estilo vis / VS Code)
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },

  -- Suas outras configurações mantidas (nvim-lspconfig, etc.)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.diagnostic.config({
        update_in_insert = true,
      })
      vim.opt.updatetime = 100

      -- Habilita os servidores
      local servers = { "ts_ls", "html", "sqls", "lua_ls", "solargraph" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
