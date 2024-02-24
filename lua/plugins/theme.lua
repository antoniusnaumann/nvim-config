local base = "#1e1e1e"
local mantle = "#282828"
local crust = "#343434"

function SetColors(dark)
  -- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = C.blue })
  -- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = C.peach })
  -- vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = base })
  -- vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = base })
  if dark then
    vim.cmd("hi NeoTreeNormal guibg=#1e1e1e")
    vim.cmd("hi NeoTreeNormalNC guibg=#1e1e1e")
  else
    -- todo: better background colors
  end
end

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
        neotree = true
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
          yellow = "#ece100",
          green = "#57e690",
          teal = "#66d4cf",
          -- sky = "#5de7ff",
          -- sapphire = "#70d6ff",
          blue = "#57a8ff",
          -- lavender = "#7c7aff",
        }
      },
      highlight_overrides = {
        macchiato = function(macchiato)
          return {
            ["@keyword"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.coroutine"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.function"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.operator"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.import"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.repeat"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.return"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.exception"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.conditional"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.storage"] = { fg = macchiato.blue, style = { "bold" } },
            ["@type.qualifier"] = { fg = macchiato.blue, style = { "bold" } },
            ["@keyword.storage.lifetime"] = { fg = macchiato.red },

            ["@type"] = { fg = macchiato.teal },
            ["@function"] = { fg = macchiato.peach },
            ["@function.call"] = { fg = macchiato.peach },
            ["@function.method"] = { fg = macchiato.peach },
            ["@function.method.call"] = { fg = macchiato.peach },
            ["@function.macro"] = { fg = macchiato.yellow },
            ["@lsp.type.function"] = { fg = macchiato.peach },
            ["@lsp.type.method"] = { fg = macchiato.peach },

            ["@variable.builtin"] = { fg = macchiato.sapphire, style = { "italic" } },
            ["@variable.parameter"] = { fg = macchiato.sapphire },
            ["@lsp.type.parameter"] = { fg = macchiato.sapphire },

            ["@lsp.type.enum"] = { style = { "italic" } },
            ["@lsp.typemod.class.defaultLibrary"] = { fg = macchiato.flamingo },

            ["@string.escape"] = { style = { "bold" } },
          }
        end,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "bold" },
        loops = { "bold" },
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = {},
        operators = {},
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
        vim.cmd("colorscheme catppuccin-macchiato")
        SetColors(true)
      end,
      set_light_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme catppuccin-latte")
        SetColors(false)
      end,
    },
  }
}
