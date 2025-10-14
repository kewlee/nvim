vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        vim.keymap.set("n", "q", "<Cmd>quit<CR>", { buffer = ev.buf })
    end,
    desc = "Close buffer with 'q'",
    pattern = {
        "help",
        "man",
        "qf",
        "scratch",
    },
})
