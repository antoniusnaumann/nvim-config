return {
   {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- Fuzzy Finder Algorithm which requires local dependencies to be built.
          -- Only load if `make` is available. Make sure you have the system
          -- requirements installed.
          {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
              return vim.fn.executable 'make' == 1
            end,
          },
      },
      config = function() 
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>s', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>S', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
        vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, {})
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

        require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

      end
  },
}
