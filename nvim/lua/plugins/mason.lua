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
                    "tsserver",
                    "rust_analyzer",
                    "clangd",
                    "jdtls",
                },
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- Opt to list sources here, when available in mason.
                    "stylua",
                    "prettier",
                    "black",
                    "google-java-format",
                    "clang-format",
                },
                automatic_installation = false,
                handlers = {},
            })
        end,
    },
}
