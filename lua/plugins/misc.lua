return { 'folke/which-key.nvim', opts = {
  event = "VeryLazy",
  init = function()
    print("init")
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,   
}, {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },   {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  }, {
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
