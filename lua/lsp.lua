vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
})

local group = vim.api.nvim_create_augroup("LspConfig", { clear = true })
local progress = { "⡿", "⣟", "⣯", "⣷", "⣾", "⣽", "⣻", "⢿" }
local triggers = {}
for ch = 32, 126 do
    table.insert(triggers, string.char(ch))
end

vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function(_)
        local lsp_names = vim.iter(
            vim.api.nvim_get_runtime_file("lsp/*.lua", true)
        )
            :map(function(file)
                return vim.fn.fnamemodify(file, ":t:r")
            end)
            :totable()

        vim.lsp.enable(lsp_names)
    end,
    desc = "Enable LSP servers",
    group = group,
    once = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    ---@param ev {buf: integer, data: {client_id: integer}}
    callback = function(ev)
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf })

        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method("textDocument/completion") then
            vim.keymap.set("i", "<Tab>", function()
                return vim.fn.pumvisible() ~= 0 and "<C-y>" or "<Tab>"
            end, { buffer = ev.buf, expr = true })

            client.server_capabilities.completionProvider.triggerCharacters =
                triggers

            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                { autotrigger = true }
            )
        end
    end,
    desc = "Configure LSP client on buffer attach",
    group = group,
})

vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local icon = ev.data.params.value.kind == "end" and "  "
            or progress[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #progress + 1]

        vim.notify(icon .. vim.lsp.status(), vim.log.levels.INFO)
    end,
    desc = "Set up LSP progress notifications",
    group = group,
})
