function UpdateColors()
  vim.cmd("colorscheme kanagawa")
  local groups = { "GitSignsAdd", "GitSignsChange", "GitSignsDelete", "DiagnosticSignError", "DiagnosticSignWarn",
    "DiagnosticSignInfo", "DiagnosticSignHint" }
  for _, group in pairs(groups) do
    vim.cmd("hi " .. group .. " guibg=None")
  end

  -- HACK  Hardcoding this here. To work, lualine needs to define a color link for this.
  vim.cmd("hi lualine_x_branch guifg=#fc81d3 guibg=#2a2a2a gui=bold")
end

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
          oldWhite = "#C0C0C0",
          fujiWhite = "#D7D7D7",
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
          samuraiRed = "#ff6d5a",
          roninYellow = "#FF9E3B",
          waveAqua1 = "#06deb2",
          dragonBlue = "#4bc5f8",

          -- Core Colors
          oniViolet = "#b670db",
          oniViolet2 = "#ec93ce",
          crystalBlue = "#7E9CD8",
          springViolet1 = "#938AA9",
          springViolet2 = "#9CABCA",
          springBlue = "#5fbbe3",
          lightBlue = "#9ee9fa", -- unused yet
          waveAqua2 = "#52e0c4",
          springGreen = "#94C25D",
          boatYellow1 = "#e2aa45",
          boatYellow2 = "#e2aa45",
          carpYellow = "#E6C384",
          sakuraPink = "#ee87a7",
          --  HACK  changing this to non-red is a quick hack
          waveRed = "#c1e467",
          peachRed = "#f07575",
          surimiOrange = "#FFA066",
          katanaGray = "#717C7C",
        }
      },
      background = {
        dark = "wave",
        light = "lotus"
      },
      overrides = function(colors)
        return {
          HopNextKey = { fg = colors.palette.roninYellow, bold = true },
          HopNextKey1 = { fg = colors.palette.dragonBlue, bold = true },
          HopNextKey2 = { fg = colors.palette.lightBlue, bold = false },
          LineNr = { bg = colors.palette.sumiInk3 },
          SignColumn = { bg = colors.palette.sumiInk3 },
          DiagnosticWarn = { fg = colors.palette.autumnYellow },
          DiagnosticFloatingWarn = { fg = colors.palette.autumnYellow },
          DiagnosticSignWarn = { fg = colors.palette.autumnYellow },
          Hack = { fg = colors.palette.roninYellow },
          WarningMsg = { fg = colors.theme.syn.DiagnosticWarn },
          ["@keyword.import"] = { fg = colors.theme.syn.keyword, bold = true },
          -- ["@keyword."] = { fg = colors.theme.syn.keyword, bold = true },
          ["@lsp.type.interface"] = { fg = colors.palette.carpYellow },
          ["@lsp.type.enum"] = { fg = colors.palette.springBlue },
          ["@lsp.type.typeParameter"] = { fg = colors.palette.oniViolet2 },
          ["@lsp.typemod.variable.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.function.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.method.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.class.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.struct.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.type.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.macro.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.enum.defaultLibrary"] = { italic = true },
          ["@lsp.typemod.enumMember.defaultLibrary"] = { italic = true },
          ["@type.qualifier"] = { fg = colors.theme.syn.keyword, bold = true },
          ["@lsp.type.lifetime"] = { fg = colors.palette.peachRed },
          ["@variable.builtin"] = { italic = false, bold = true, fg = colors.theme.syn.parameter }
        }
      end,
    }
  },
  {
    'catpuccin/catppuccin',
  },
  {
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.g.kanagawa_lualine_bold = true
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme kanagawa")

        UpdateColors()
      end,
      set_light_mode = function()
        vim.g.kanagawa_lualine_bold = true
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme kanagawa")

        UpdateColors()

        -- TODO  configure light mode
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
