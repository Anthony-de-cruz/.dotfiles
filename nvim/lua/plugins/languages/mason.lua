return {
    {
        "williamboman/mason.nvim",

        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "html",
                    "cssls",
                    "gopls",
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                    "jdtls",
                    "csharp_ls",
                    "zls",
                },
            })
        end,
    },
}
