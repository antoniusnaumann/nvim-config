return {
  'folke/which-key.nvim',
  'nvim-tree/nvim-web-devicons',
  opts = {},
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = ' ',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filetype', icons_enabled = true }, 'filename' },
        lualine_c = { {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
        } },
        lualine_x = { { 'diff', symbols = { added = ' ', modified = '󰝤 ', removed = ' ' }, }, { 'branch', icon = { "" } } },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        ---Line-comment toggle keymap
        line = 'CC',
        ---Block-comment toggle keymap
        block = 'CBB',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = 'C',
        ---Block-comment keymap
        block = 'CB',
      },
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
      },
    },
    lazy = false,
  }
}
