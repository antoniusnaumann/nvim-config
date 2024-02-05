return {
    -- 'arzg/vim-colors-xcode',
    'jeffkreeftmeijer/vim-dim',
    'chriskempson/base16-vim',
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        transparent = true,
      },
    },
    {
      'AlexvZyl/nordic.nvim',
      lazy = false,
      priority = 1000,
      config = function()
          require 'nordic' .setup {
              bold_keywords = true,
              italic_comments = true,
              transparent_bg = true,
              leap = {
                  dim_backdrop = false,
              },
          }
      end
    },
    {
      'Luxed/ayu-vim',
    },
    {
      'f-person/auto-dark-mode.nvim',
      config = {
        update_interval = 1000,
        set_dark_mode = function()
          vim.cmd("set termguicolors")
          vim.api.nvim_set_option("background", "dark")
          vim.g.ayucolor = "dark"
          vim.cmd("colorscheme ayu")
        end,
        -- TODO: Look for a cool light theme to use here
        set_light_mode = function()
          vim.cmd("set termguicolors")
          vim.api.nvim_set_option("background", "light")
          vim.cmd("colorscheme ayu")
        end,
    },
  }
}
