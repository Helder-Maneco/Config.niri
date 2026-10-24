return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    local js_db_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"

    require("dap-vscode-js").setup({
      debugger_path = js_db_path,
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    -- SOLUÇÃO DO ERRO: Definição manual do adaptador para gerenciar a porta automaticamente
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- Certifique-se de que o link simbólico out/src/vsDebugServer.js foi criado como orientado
        args = { js_db_path .. "/out/src/vsDebugServer.js", "${port}" },
      }
    }

    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "Debug: Toggle UI Window" })

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Current File (pwa-node)",
          cwd = vim.fn.getcwd(),
          args = { "${file}" },
          sourceMaps = true,
          protocol = "inspector",
          runtimeExecutable = "node",
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        },
      }
    end
  end
}
