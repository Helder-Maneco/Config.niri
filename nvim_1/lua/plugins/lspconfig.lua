return {
  {
    "nanotee/sqls.nvim",
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Habilita o tracejado/diagnósticos em tempo real no Insert Mode
      vim.diagnostic.config({
        update_in_insert = true,
      })

      -- Acelera o tempo de resposta do LSP (de 400ms padrão para 100ms)
      vim.opt.updatetime = 100

      -- Configuração customizada do lua_ls
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- Configuração customizada do sqls
      vim.lsp.config("sqls", {
        root_dir = function() return vim.fn.getcwd() end,
        on_attach = function(client, bufnr)
          local status, sqls = pcall(require, "sqls")
          if status then
            sqls.on_attach(client, bufnr)
          end
        end,
        settings = {
          sqls = {
            connections = {
              {
                driver = "postgresql",
                dataSourceName = "postgres://dev_user:200719@127.0.0.1:5432/meu_projeto?sslmode=disable",
              },
            },
          },
        },
      })

      -- Habilita os servidores definidos na API nativa
      local servers = { "ts_ls", "html", "sqls", "lua_ls", "solargraph" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
