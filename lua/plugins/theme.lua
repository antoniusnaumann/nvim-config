return {
  {
    'rebelot/kanagawa.nvim',
    config = {
      keywordStyle = { bold = true, italic = false },
      colors = {
        palette = {
          -- Dark Mode Background
          sumiInk0 = "#161616",
          sumiInk1 = "#181818",
          sumiInk2 = "#1a1a1a",
          sumiInk3 = "#1e1e1e",
          sumiInk4 = "#2a2a2a",
          sumiInk5 = "#363636",
          sumiInk6 = "#545454",

          -- Light Mode Background
          lotusWhite0 = "#d5d5d5",
          lotusWhite1 = "#dcdcdc",
          lotusWhite2 = "#e5e5e5",
          lotusWhite3 = "#f2f2f2",
          lotusWhite4 = "#e7e7e7",
          lotusWhite5 = "#e1e1e1",

          -- Fg and Comments
          oldWhite = "#C8C8C8",
          fujiWhite = "#DCDCDC",
          fujiGray = "#727272",

          -- Diff
          winterGreen = "#2B3328",
          winterYellow = "#49443C",
          winterRed = "#43242B",
          winterBlue = "#252535",

          -- Git
          autumnGreen = "#89dd20",
          autumnRed = "#f85c40",
          autumnYellow = "#fcc30d",

          -- Popup and Floats
          waveBlue1 = "#223249",
          waveBlue2 = "#2D4F67",

          -- Diagnostics
          samuraiRed = "#E82424",
          roninYellow = "#FF9E3B",
          waveAqua1 = "#06deb2",
          dragonBlue = "#4bc5f8",

          -- Core Colors
          oniViolet = "#9978CF",
          oniViolet2 = "#e46afc",
          crystalBlue = "#5882d8",
          springViolet1 = "#938AA9",
          springViolet2 = "#9CABCA",
          springBlue = "#4bc5f8",
          lightBlue = "#A3D4D5", -- unused yet
          waveAqua2 = "#43957e",
          springGreen = "#94C25D",
          boatYellow1 = "#e2aa45",
          boatYellow2 = "#fcc30d",
          carpYellow = "#E6C384",
          sakuraPink = "#FF739F",
          waveRed = "#E46876",
          peachRed = "#FF645C",
          surimiOrange = "#FFA066",
          katanaGray = "#717C7C",
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
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = { "*" },
      user_default_options = {
        mode = "virtualtext",
      }
    }
  }
}
