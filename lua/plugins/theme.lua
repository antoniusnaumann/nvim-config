local base = "#1e1e1e"
local mantle = "#282828"
local crust = "#343434"

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = {
      flavour = "macchiato",
      integrations = {
        mason = true,
        which_key = true,
        hop = true,
      },
      color_overrides = {
        frappe = {
          base = base,
          mantle = mantle,
          crust = crust
        },
        mocha = {
          base = base,
          mantle = mantle,
          crust = crust
        },
        macchiato = {
          base = base,
          mantle = mantle,
          crust = crust,
          -- Apple-like colors
          -- TODO: Tweak the commented colors to be a bit more pastel-like
          -- rosewater
          -- flamingo
          -- mauve = "#da8fff",
          -- pink = "#ff6483",
          red = "#ff8680",
          -- maroon = "#FF8E53",
          peach = "#ffc266",
          yellow = "#ffd426",
          green = "#8cf29b",
          teal = "#66d4cf",
          -- sky = "#5de7ff",
          -- sapphire = "#70d6ff",
          blue = "#57a8ff",
          -- lavender = "#7c7aff",
        }
      }
    }
  },
  {
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme catppuccin-macchiato")
      end,
      set_light_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme catppuccin-latte")
      end,
    },
  }
}
