local colorscheme = 'monokai_pro'

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify(colorscheme .. 'not found!')
    return
end
