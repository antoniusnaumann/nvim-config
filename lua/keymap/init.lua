local colemak = true

vim.keymap.set({ "n", "v" }, "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })
vim.keymap.set({ "n", "v" }, "<leader>s", vim.cmd.w, { desc = "Save Current File" })
vim.keymap.set({ "n", "v" }, "<leader>S", vim.cmd.wa, { desc = "Save All" })
vim.keymap.set({ "n", "v" }, "<leader>x", vim.cmd.x, { desc = "Save & Close Current Buffer" })
vim.keymap.set({ "n", "v" }, "<leader>q", vim.cmd.q, { desc = "Close Current Buffer" })
vim.api.nvim_set_keymap("i", "<esc>", "<C-c>", { desc = "Exit insert mode" })
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

Key_prev = '<C-k>'
Key_next = '<C-j>'
Key_left = 'h'
Key_right = 'l'

function Reregister()
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
        noremap('gn', '^')
        noremap('gN', '0')
        noremap('go', '$')
        noremap('ge', '10j')
        noremap('gi', '10k')

        noremap('dn', 'd^')
        noremap('dN', 'd0')
        noremap('do', 'd$')

        noremap('yn', 'y^')
        noremap('yN', 'y0')
        noremap('yo', 'y$')

        noremap('cn', 'c^')
        noremap('cN', 'c0')
        noremap('co', 'c$')

        -- Navigate dialog
        Key_prev = '<C-i>'
        Key_next = '<C-e>'
        Key_left = 'n'
        Key_right = 'o'
    else
        -- TODO: Remove colemak mappings here
        -- More ergonomic movement
        noremap('gh', '^')
        noremap('gH', '0')
        noremap('gl', '$')
        noremap('gj', '10j')
        noremap('gk', '10k')

        noremap('dh', 'd^')
        noremap('dH', 'd0')
        noremap('dl', 'd$')

        noremap('yh', 'y^')
        noremap('yH', 'y0')
        noremap('yl', 'y$')

        noremap('ch', 'c^')
        noremap('cH', 'c0')
        noremap('cl', 'c$')

        -- Navigate dialog
        Key_prev = '<C-k>'
        Key_next = '<C-j>'
        Key_left = 'h'
        Key_right = 'l'
    end
    noremap(Key_prev, '<C-p>')
    noremap(Key_next, '<C-n>')
end

Reregister()

vim.api.nvim_create_user_command('Asdf',
    function()
        colemak = false
        Reregister()
        print("Switched keymap to QWERTY")
    end, {})
vim.api.nvim_create_user_command('Arst',
    function()
        colemak = true
        Reregister()
        print("Switched keymap to Colemak")
    end, {})

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

-- Paste in next line with P 
noremap('P', 'o<esc>P')

-- Window mode
noremap('<leader>w', '<C-w>')
