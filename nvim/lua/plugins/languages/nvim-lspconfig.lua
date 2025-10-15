return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Default Setups
        local servers = {
            "pyright",
            "html",
            "cssls",
            -- "ts_ls",
            -- "gopls",
            "lua_ls",
            -- "rust_analyzer",
            -- "omnisharp",
            "csharp_ls",
            "zls"
        }

       for _, lsp in ipairs(servers) do
           vim.lsp.config[lsp] = { capabilities = capabilities }
       end

        -- Custom Setups
        vim.lsp.config["clangd"] = {
            capabilities = capabilities,
            cmd = { "clangd", "--clang-tidy" },
        }
    end,
}
