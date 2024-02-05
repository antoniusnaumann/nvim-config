return {
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        -- LSP installer
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

    {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

}
