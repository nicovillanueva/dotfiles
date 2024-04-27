-- vim.keymap.set("n", "<leader>pe", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<leader>n", vim.cmd.NERDTreeFocus)
vim.keymap.set("n", "<C-n>", vim.cmd.NERDTree)
vim.keymap.set("n", "<C-t>", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<C-f>", vim.cmd.NERDTreeFind)


-- Start NERDTree. If a file is specified, move the cursor to its window.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

vim.api.nvim_create_autocmd("StdinReadPre", {
    pattern = "*",
    callback = function()
        vim.g.std_in = 1
    end,
})

-- If opened nvim with an argument, open NT but focus on the file
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd.NERDTree()
        if #vim.fn.argv() > 0 or vim.g.std_in then
            vim.cmd('wincmd p')
        end
    end
})

-- Exit Vim if NERDTree is the only window remaining in the only tab.
-- WIP
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.tabpagenr("$") == 1 and vim.fn.winnr("$") and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
            print("would exit")
        end
    end
})
