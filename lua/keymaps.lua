-- Clipboard
vim.keymap.set("x", "<Leader>yy", '"+y')

-- Diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

vim.keymap.set("n", "[e", function()
    vim.diagnostic.jump({
        count = -1,
        severity = vim.diagnostic.severity.ERROR,
    })
end)

vim.keymap.set("n", "]e", function()
    vim.diagnostic.jump({
        count = 1,
        severity = vim.diagnostic.severity.ERROR,
    })
end)

-- Netrw
vim.keymap.set("n", "-", "<Cmd>Explore<CR>")

-- Quickfix
vim.keymap.set("n", "<q", "<Cmd>colder<CR>")
vim.keymap.set("n", ">q", "<Cmd>cnewer<CR>")

vim.keymap.set("n", "<Leader>q", function()
    local qflist = vim.fn.getqflist({ winid = 0, size = 0 })
    if qflist.winid == 0 then
        if qflist.size > 0 then
            vim.cmd("botright copen")
        else
            vim.notify("Quickfix list is empty", vim.log.levels.INFO)
        end
    else
        vim.cmd("cclose")
    end
end)

-- Tabs
vim.keymap.set("n", "<M-h>", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<M-l>", "<Cmd>tabnext<CR>")

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
