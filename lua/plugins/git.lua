return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
          {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation to next / previous change
        map({ 'n', 'v' }, ']g', function()
          if vim.wo.diff then
            return ']g'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to Next Git Hunk' })

        map({ 'n', 'v' }, '[g', function()
          if vim.wo.diff then
            return '[g'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to Previous Git Hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git Stage Hunk' })
        map('v', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git Reset Hunk' })
        -- normal mode
        map('n', '<leader>gs', gs.stage_hunk, { desc = '[G]it [S]tage Hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [R]eset Hunk' })
        map('n', '<leader>gS', gs.stage_buffer, { desc = '[G]it [S]tage Buffer' })
        map('n', '<leader>gz', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = '[G]it [R]eset Buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = '[P]review Git Hunk' })
        map('n', '<leader>gb', function()
          gs.blame_line { full = false }
        end, { desc = '[G]it [B]lame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [D]iff Against Index' })
        map('n', '<leader>gD', function()
          gs.diffthis '~'
        end, { desc = '[G]it [D]iff Against Last Commit' })

        -- Toggles
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[T]oggle [G]it [B]lame Line' })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[T]oggle [G]it Show [D]eleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })
      end,
    },
   },
  }
}
