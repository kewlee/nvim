require("globals")
require("options")
require("colorscheme")
require("keymaps")
require("autocmds")
require("lsp")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })

    if vim.v.shell_error > 0 then
        vim.api.nvim_echo({
            { "Could not clone lazy.nvim:\n" .. out .. "\n", "ErrorMsg" },
        }, true, {})
        return
    end
end

vim.opt.rtp:prepend(lazy_path)

local lazy_spec = {
    { import = "plugins" },
}

if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/plugins/override") then
    table.insert(lazy_spec, { import = "plugins.override" })
end

require("lazy").setup({
    change_detection = {
        notify = false,
    },
    install = {
        colorscheme = { "default" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
            },
        },
    },
    spec = lazy_spec,
})
