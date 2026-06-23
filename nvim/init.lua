 require('config.options')
 require('config.keybinds')
 require('config.lazy')
 -- Silenciar avisos de deprecation (como o do lspconfig)
vim.deprecate = function() end
-- 1. Abrir o terminal (mantemos o comando que já funciona bem)
vim.keymap.set('n', '<C-`>', '<CMD>botright split | resize 10 | term<CR>i', { desc = "Abrir terminal" })

vim.opt.clipboard = "unnamedplus"
-- Navegar para a próxima aba com Ctrl + Tab
vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.g.mapleader = " " -- Aqui, o espaço foi definido como leader
-- Navegar para a aba anterior com Ctrl + Shift + Tab
vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })
-- 2. A MAGIA: Ao clicar Esc dentro do terminal, ele fecha a janela automaticamente
-- O comando ':q!' força o fecho da janela do terminal mesmo que haja processos a correr
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>:q!<CR>]], { desc = "Sair e fechar terminal" })

vim.opt.splitbelow = true -- Abrir novos splits horizontais em baixo
vim.opt.splitright = true -- Abrir novos splits verticais à direita



-- Abre/Fecha o banco de dados com <Leader>db
vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', { noremap = true, silent = true })

-- Executa a linha atual no banco de dados com <Leader>S
vim.keymap.set('n', '<leader>S', '<Plug>(DBUI_ExecuteQuery)', { noremap = false })




-- Força a transparência da coluna lateral e dos números
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

-- Se o Kanagawa ainda estiver a lutar, este comando limpa o fundo de vez
vim.cmd([[
  highlight SignColumn guibg=NONE
  highlight LineNr guibg=NONE
  highlight CursorLineNr guibg=NONE
]])
-- Abrir/Fechar a árvore com um comando rápido
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true })
-- Força as cores a serem monocromáticas na árvore
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#abb2bf" })
-- Isso mantém os ícones, mas remove as cores "carnaval"
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = "#abb2bf" })
