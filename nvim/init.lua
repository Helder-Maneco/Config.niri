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





--------------
-- Função de Diagnóstico para Transparência
local function clear_bg(group)
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

-- 1. Limpando a barra de abas nativa (TabLine)
clear_bg("TabLine")
clear_bg("TabLineFill")
clear_bg("TabLineSel")

-- 2. Se você estiver usando o Bufferline.nvim (O Plugin de Elite)
-- Precisamos limpar os grupos específicos do plugin
local highlights = {
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineSeparatorVisible",
    "BufferLineSeparatorSelected",
    "BufferLineTab",
    "BufferLineTabSelected",
    "BufferLineTabSeparator",
}

for _, hl in ipairs(highlights) do
    clear_bg(hl)
end




----
-- Função de Elite para forçar o vácuo de cor
local function make_transparent(group)
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

-- Grupos específicos para a aba que está aberta (selecionada)
local selected_groups = {
    "BufferLineBufferSelected",
    "BufferLineTabSelected",
    "BufferLineSeparatorSelected",
    "BufferLineModifiedSelected",
    "BufferLineIndicatorSelected", -- Aquela barrinha lateral ou inferior
    "BufferLineDevIconJsSelected", -- Específico para o ícone de JS que vi na imagem
}

for _, group in ipairs(selected_groups) do
    make_transparent(group)
end


--------------------------------
-- Função de Elite para forçar o vácuo de cor (use a mesma que já criamos)
local function make_transparent(group)
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

-- Grupos específicos para limpar a árvore de diretórios
local nvim_tree_ui = {
    "NvimTreeWinBar",       -- Onde está escrito "Explorador de Arquivos"
    "NvimTreeNormal",       -- O fundo geral da árvore
    "NvimTreeNormalNC",     -- O fundo quando a árvore não está focada
    "NvimTreeEndOfBuffer",  -- Remove os '~' no final da árvore
}

for _, group in ipairs(nvim_tree_ui) do
    make_transparent(group)
end



local function purificar_interface()
    local grupos = {
        "NvimTreeWinBar",       -- O bloco "Files"
        "NvimTreeWinBarNC",     -- Bloco quando não focado
        "NvimTreeNormal",       -- Fundo da árvore
        "NvimTreeNormalNC",     -- Fundo da árvore (não focado)
        "BufferLineSeparator",  -- Limpa resíduos dos triângulos
        "BufferLineFill",       -- Fundo vazio da barra de abas
    }
    
    for _, grupo in ipairs(grupos) do
        vim.api.nvim_set_hl(0, grupo, { bg = "NONE", ctermbg = "NONE" })
    end
end

-- Gatilho científico para garantir que o tema não sobrescreva isso
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = purificar_interface,
})

purificar_interface()
