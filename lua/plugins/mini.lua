return {
    -- Diff
    {
        "nvim-mini/mini.diff",
        event = "BufRead",
        keys = {
            {
                "<Leader>hp",
                function()
                    MiniDiff.toggle_overlay()
                end,
                desc = "(mini.diff) Toggle diff overlay",
            },
        },
        opts = {
            view = {
                signs = {
                    add = "+",
                    change = "~",
                    delete = "_",
                },
                style = "sign",
            },
        },
    },

    -- Git
    {
        "nvim-mini/mini-git",
        cmd = "Git",
        event = "BufRead",
        main = "mini.git",
        keys = {
            {
                "<Leader>hb",
                function()
                    MiniGit.show_at_cursor()
                end,
                desc = "(mini.git) Show Git-related information at cursor",
                mode = { "n", "x" },
            },
        },
        opts = {},
    },

    -- Hipatterns
    {
        "nvim-mini/mini.hipatterns",
        event = "BufRead",
        opts = function()
            return {
                highlighters = {
                    fixme = {
                        pattern = "%f[%w]()FIXME()%f[%W]",
                        group = "MiniHipatternsFixme",
                    },
                    hack = {
                        pattern = "%f[%w]()HACK()%f[%W]",
                        group = "MiniHipatternsHack",
                    },
                    todo = {
                        pattern = "%f[%w]()TODO()%f[%W]",
                        group = "MiniHipatternsTodo",
                    },
                    note = {
                        pattern = "%f[%w]()NOTE()%f[%W]",
                        group = "MiniHipatternsNote",
                    },
                    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
                },
            }
        end,
    },

    -- Sessions
    {
        "nvim-mini/mini.sessions",
        keys = {
            {
                "<Leader>ss",
                function()
                    if vim.v.this_session == "" then
                        vim.notify("No session loaded", vim.log.levels.ERROR)
                    else
                        MiniSessions.write()
                    end
                end,
                desc = "(mini.sessions) Save to current session",
            },
            {
                "<Leader>sw",
                function()
                    MiniSessions.select("write")
                end,
                desc = "(mini.sessions) Select a session to overwrite",
            },
            {
                "<Leader>sl",
                function()
                    MiniSessions.select("read")
                end,
                desc = "(mini.sessions) Select a session to read",
            },
            {
                "<Leader>sd",
                function()
                    MiniSessions.select("delete")
                end,
                desc = "(mini.sessions) Select a session to delete",
            },
        },
        opts = {
            autowrite = false,
        },
    },

    -- Statusline
    {
        "nvim-mini/mini.statusline",
        event = "VimEnter",
        opts = {
            content = {
                active = function()
                    -- stylua: ignore start
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 60 })
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                    local git           = MiniStatusline.section_git({ trunc_width = 80 })
                    local diff          = MiniStatusline.section_diff({ trunc_width = 60 })
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 80 })
                    -- stylua: ignore end

                    return MiniStatusline.combine_groups({
                        {
                            hl = mode_hl,
                            strings = { mode },
                        },
                        {
                            hl = "MiniStatuslineDevInfo",
                            strings = { git, diff },
                        },
                        "%<",
                        {
                            hl = "MiniStatuslineFilename",
                            strings = { filename },
                        },
                        "%=",
                        {
                            hl = "MiniStatuslineFileinfo",
                            strings = { fileinfo },
                        },
                        {
                            hl = mode_hl,
                            strings = { "Ln %l│Col %v│%P" },
                        },
                    })
                end,
            },
        },
    },
}
