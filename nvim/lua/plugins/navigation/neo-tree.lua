return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        require("neo-tree").setup({
            vim.keymap.set("n", "<leader>pv", ":Neotree filesystem reveal float<CR>"),
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(arg)
                        vim.opt.nu = true
                        vim.opt.relativenumber = true
                    end,
                },
            },
            filesystem = {
                filtered_items = {
                    --visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        ".github",
                        "package-lock.json",
                    },
                    never_show = { ".git" },
                },
            },
            window = {
                mappings = {
                    ["P"] = {
                        "toggle_preview",
                        config = {
                            use_float = false,
                            use_image_nvim = true,
                            -- use_snacks_image = true,
                            title = 'Neo-tree Preview',
                        },
                    },
                }
            }
        })
    end,
}
