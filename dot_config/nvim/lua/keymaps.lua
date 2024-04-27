local telebuiltin = require('telescope.builtin')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.NERDTreeToggle)

vim.keymap.set('n', '<leader>ff', telebuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telebuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telebuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telebuiltin.help_tags, {})

-- Move stuff around with J/K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- C-u/d but keep it centered
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- overwrite on paste
vim.keymap.set('x', '<leader>p', "\"_dP")

-- replace word I'm on
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {})
-- tab management
-- vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
-- vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
-- vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious)
-- vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)

vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>", {})
vim.keymap.set("n", "<leader>tv", ":!terraform validate<CR>", {})
vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>", {})
vim.keymap.set("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", {})
