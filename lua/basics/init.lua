vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.wo.number = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 200
vim.o.timeoutlen = 400

vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
