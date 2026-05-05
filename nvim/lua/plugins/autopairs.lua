return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- Adicionamos a dependência para garantir que o cmp seja baixado/carregado
    dependencies = { "hrsh7th/nvim-cmp" }, 
    config = function()
        local autopairs = require("nvim-autopairs")
        
        autopairs.setup({
            check_ts = true, -- Habilita integração com Treesitter
            disable_filetype = { "TelescopePrompt" },
            fast_wrap = {
                map = "<M-e>", -- Atalho para envolver uma palavra com o par (Alt+e)
            },
        })
        
        -- O SEGREDO: Usamos pcall para tentar carregar o cmp sem quebrar o Neovim
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if cmp_status_ok then
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        else
            -- Se o Senhor vir isso, o nvim-cmp não está instalado ou falhou
            print("Aviso: nvim-cmp não encontrado, pulando integração de autopairs.")
        end
    end
}
