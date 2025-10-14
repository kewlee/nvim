vim.cmd("colorscheme slate")

local highlights = {
    Identifier = { bg = "none" },
    Normal = { bg = "none" },
    PMenu = { bg = "#2f2f2f" },
    SignColumn = { bg = "none" },
    StatusLine = { bg = "none" },
    StatusLineNC = { bg = "none" },
    StatusLineTerm = { bg = "none" },
    StatusLineTermNC = { bg = "none" },
    VertSplit = { bg = "none", fg = "#d7d787" },
}

for name, val in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, val)
end
