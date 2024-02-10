local function updateColors(light)
  SetBaseColors(light)
  require('base16-colorscheme').setup({
    base00 = Colors.bg,
    base01 = '#636366',     -- light gray, line selection in file explorer
    base02 = '#212124',     -- very dark gray, some bars
    base03 = '#48484a',     -- dark gray, comments
    base04 = '#aeaeb2',     -- very light gray, line numbers
    base05 = Colors.fg,     -- unhighlighted text
    base06 = '#ffffff',     -- ???
    base07 = '#ffffff',     -- ???
    base08 = '#1a94ff',     -- blueish white, variables
    base09 = Colors.purple, -- number literals
    base0A = Colors.mint,   -- class names
    base0B = Colors.lime,   -- string literals
    base0C = Colors.yellow, -- warnings
    base0D = '#ffea80',     -- yellowish white, function calls
    base0E = Colors.orange, -- keywords
    base0F = '#ffffff',     -- , commas
  }, { 
    telescope_borders = true,
    })
  require('ayu').setup({
    overrides = {
      Normal = { bg = "None" },
    }
  })
  -- TODO: Tweak visual mode highlights
  -- TODO: Tweak telescope borders
  -- TODO: Tweak flash label colors
  -- TODO: Rust color clashes:
  --        - local variables, parameters, qualified paths and macro invocations
  --        - trait names and keywords (LSP semantic highlighting only)
  --        - lifetimes and class names
end

return {
  {
    'Shatur/neovim-ayu',
  },
  {
    'RRethy/nvim-base16'
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

        updateColors(false)
      end,
      set_light_mode = function()
        vim.cmd("set termguicolors")
        -- vim.api.nvim_set_option("background", "light")
        -- vim.cmd("colorscheme ayu")
        -- TODO: Set scheme to light mode here
        vim.api.nvim_set_option("background", "dark")
        vim.g.ayucolor = "dark"
        vim.cmd("colorscheme ayu")

        updateColors(false)
      end,
    },
  }
}
