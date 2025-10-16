return {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                    },
                },
            },
        },
        fuzzy = {
            implementation = "rust",
        },
        keymap = {
            preset = "super-tab",
        },
    },
    version = "1.*",
}
