---@brief
---
--- Code taken from "folke/snacks.nvim":
---
--- https://github.com/folke/snacks.nvim/blob/main/lua/snacks/bigfile.lua
---

local MAX_FILE_SIZE = 2.0 * 1024 * 1024
local MAX_LINE_SIZE = 1000

local function on_attach(ft, buf)
    vim.notify("Big file detected.", vim.log.levels.WARN)

    vim.wo[0].conceallevel = 0
    vim.wo[0].foldmethod = "manual"
    vim.wo[0].statuscolumn = ""

    vim.b.minidiff_disable = true
    vim.b.minihipatterns_disable = true

    vim.schedule(function()
        if vim.api.nvim_buf_is_valid(buf) then
            vim.bo[buf].syntax = ft
        end
    end)
end

vim.filetype.add({
    pattern = {
        [".*"] = {
            function(path, buf)
                if
                    not path
                    or not buf
                    or path ~= vim.api.nvim_buf_get_name(buf)
                then
                    return
                end

                local fsize = vim.fn.getfsize(path)
                if fsize <= 0 then
                    return
                elseif fsize > MAX_FILE_SIZE then
                    return "bigfile"
                end

                local line_count = vim.api.nvim_buf_line_count(buf)
                if ((fsize - line_count) / line_count) > MAX_LINE_SIZE then
                    return "bigfile"
                end
            end,
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        vim.api.nvim_buf_call(ev.buf, function()
            on_attach(vim.filetype.match({ buf = ev.buf }) or "", ev.buf)
        end)
    end,
    group = vim.api.nvim_create_augroup("bigfile", { clear = true }),
    pattern = "bigfile",
})
