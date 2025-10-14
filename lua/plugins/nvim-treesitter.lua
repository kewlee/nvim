return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        vim.api.nvim_create_user_command("TSInstallInfer", function()
            local ft = vim.bo.filetype
            local lang = vim.treesitter.language.get_lang(ft)
            if not lang then
                ft = vim.split(ft, ".", { plain = true })[1]
                lang = vim.treesitter.language.get_lang(ft) or ft
            end
            vim.cmd("TSInstall " .. lang)
        end, {
            desc = "Install Treesitter parser for current buffer's filetype",
        })
    end,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            keys = {
                {
                    "[c",
                    function()
                        require("treesitter-context").go_to_context(
                            vim.v.count1
                        )
                    end,
                    desc = "(Treesitter) Jump to current context",
                    silent = true,
                },
            },
            opts = {
                max_lines = 5,
                multiline_threshold = 1,
                min_window_height = 20,
            },
        },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    event = "FileType",
    opts = {
        ensure_installed = {
            "lua",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
        },
        highlight = {
            enable = true,
        },
        -- NOTE: See this link for available Treesitter text objects.
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#built-in-textobjects
        textobjects = {
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]t"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[t"] = "@class.outer",
                },
            },
            select = {
                enable = true,
                keymaps = {
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["at"] = "@class.outer",
                    ["it"] = "@class.inner",
                },
            },
        },
    },
}
