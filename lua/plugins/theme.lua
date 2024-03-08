return {
  {
    'rebelot/kanagawa.nvim',
    config = {
      keywordStyle = { bold = true, italic = false },
      colors = {
        palette = {
          -- change all usages of these colors
          sumiInk0 = "#161616",
          sumiInk1 = "#181818",
          sumiInk2 = "#1a1a1a",
          sumiInk3 = "#1e1e1e",
          sumiInk4 = "#2a2a2a",
          sumiInk5 = "#363636",
          sumiInk6 = "#545454",

          lotusWhite0 = "#d5d5d5",
          lotusWhite1 = "#dcdcdc",
          lotusWhite2 = "#e5e5e5",
          lotusWhite3 = "#f2f2f2",
          lotusWhite4 = "#e7e7e7",
          lotusWhite5 = "#e1e1e1",
        }
      },
      background = {
        dark = "wave",
        light = "lotus"
      },
    }
  },
  {
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme kanagawa")
      end,
      set_light_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme kanagawa")

        -- todo: configure light mode
        -- vim.cmd("set termguicolors")
        -- vim.api.nvim_set_option("background", "light")
        -- vim.cmd("colorscheme catppuccin-latte")
        -- SetColors(false)
      end,
    },
  }
}
