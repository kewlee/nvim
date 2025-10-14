return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
        {
            "<Leader>fb",
            "<Cmd>FzfLua buffers<CR>",
            desc = "(fzf) List open buffer",
        },
        {
            "<Leader>ff",
            "<Cmd>FzfLua files<CR>",
            desc = "(fzf) Search for a file",
        },
        {
            "<Leader>fd",
            "<Cmd>FzfLua diagnostics_workspace<CR>",
            desc = "(fzf) List diagnostic messages",
        },
        {
            "<Leader>f/",
            "<Cmd>FzfLua git_bcommits<CR>",
            desc = "(fzf) List Git commits for current buffer",
        },
        {
            "<Leader>f'",
            "<Cmd>FzfLua git_status<CR>",
            desc = "(fzf) List contents of Git working tree",
        },
        {
            "<Leader>fs",
            "<Cmd>FzfLua grep_cword<CR>",
            desc = "(fzf) Search for word under cursor",
            mode = "n",
        },
        {
            "<Leader>fs",
            "<Cmd>FzfLua grep_visual<CR>",
            desc = "(fzf) Search for visual selection",
            mode = "x",
        },
        {
            "<Leader>fk",
            "<Cmd>FzfLua keymaps<CR>",
            desc = "(fzf) List registered key mappings",
        },
        {
            "<Leader>fg",
            "<Cmd>FzfLua live_grep<CR>",
            desc = "(fzf) Search for a pattern",
        },
        {
            "<Leader>fr",
            "<Cmd>FzfLua resume<CR>",
            desc = "(fzf) Resume previous search",
        },
    },
    opts = {
        "border-fused",
        fzf_colors = true,
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
        keymaps = {
            previewer = false,
        },
        winopts = {
            preview = {
                layout = "vertical",
                vertical = "down:50%",
            },
            width = 0.65,
        },
    },
}
