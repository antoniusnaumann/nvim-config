local colemak = false

vim.keymap.set({ "n", "v" }, "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })
vim.keymap.set({ "n", "v" }, "<leader>s", vim.cmd.wa, { desc = "Save All" })
vim.keymap.set({"n", "v" }, "<leader>x", vim.cmd.q, { desc = "Close Current Buffer" })
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

local function noremap(old, new)
    vim.api.nvim_set_keymap('n', old, new, { noremap = true })
    vim.api.nvim_set_keymap('v', old, new, { noremap = true })
end

local function map(old, new)
    vim.api.nvim_set_keymap('n', old, new, { noremap = false })
    vim.api.nvim_set_keymap('v', old, new, { noremap = false })
end

local function vnoremap(old, new)
    vim.api.nvim_set_keymap('v', old, new, { noremap = true })
end

local function nnoremap(old, new)
    vim.api.nvim_set_keymap('n', old, new, { noremap = true })
end

if colemak then
    noremap('n', 'h')
    noremap('N', 'H')
    noremap('j', 'n')
    noremap('J', 'N')
    noremap('e', 'j')
    noremap('E', 'J')
    noremap('k', 'e')
    noremap('K', 'E')
    noremap('h', 'i')
    noremap('H', 'I')
    noremap('i', 'k')
    noremap('I', 'K')
    noremap('o', 'l')
    noremap('O', 'L')
    noremap('l', 'o')
    noremap('L', 'O')

    -- Ergonomic movement to end / start
    map('gn', '^')
    map('gN', '0')
    map('go', '$')
    map('ge', '10e')
    map('gi', '10i')

    map('dn', 'd^')
    map('dN', 'd0')
    map('do', 'd$')

    map('yn', 'y^')
    map('yN', 'y0')
    map('yo', 'y$')

    map('cn', 'c^')
    map('cN', 'c0')
    map('co', 'c$')
else
    -- More ergonomic movement
    map('gh', '^')
    map('gH', '0')
    map('gl', '$')
    map('gj', '10j')
    map('gk', '10k')

    map('dh', 'd^')
    map('dH', 'd0')
    map('dl', 'd$')

    map('yh', 'y^')
    map('yH', 'y0')
    map('yl', 'y$')

    map('ch', 'c^')
    map('cH', 'c0')
    map('cl', 'c$')
end

-- Helix-like line marking
nnoremap('x', '0v$')
nnoremap('X', 'k$v0')
vnoremap('x', 'j$')
vnoremap('X', 'k0')

map('gE', 'G')

-- Use z for undo and Z for redo
noremap('z', 'u')
noremap('Z', 'U')
nnoremap('u', 'gu')
nnoremap('U', 'gU')
-- TODO: Good rebind for switch case

-- Use tab for indenting
nnoremap('<Tab>', '>>')
nnoremap('<S-Tab>', '<<')
vnoremap('<Tab>', '>')
vnoremap('<S-Tab>', '<')

noremap('mm', '%')
noremap('mi', 'mnmE')
noremap('mI', 'memN')

-- Delete current selection
nnoremap('D', 'x')
vnoremap('D', 'd<esc>')

-- Window mode
noremap('<leader>w', '<C-w>')
