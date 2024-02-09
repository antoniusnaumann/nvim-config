local function updateColors(light)
  local bg
  if light then bg = '#dedede' else bg = '#1c1c1e' end
  require('base16-colorscheme').setup({
    base00 = bg,
    base01 = '#636366', -- gray, line selection in file explorer
    base02 = '#212124', -- gray, some bars
    base03 = '#48484a', -- dark gray, comments
    base04 = '#aeaeb2', -- light gray, line numbers
    base05 = '#f2f2f7', -- white, unhighlighted text
    base06 = '#ffffff', -- ???
    base07 = '#ffffff', -- ???
    base08 = '#1a94ff', -- blueish white, variables
    base09 = '#d189f5', -- purple, number literals
    base0A = '#41d496', -- greenish mint, class names
    base0B = '#7dd70f', -- lime, string literals
    base0C = '#ffd60a', -- yellow, warnings
    base0D = '#ffea80', -- yellowish white, function calls
    base0E = '#ff9f0a', -- orange, keywords
    base0F = '#ffffff', -- , commas
  })
  -- TODO: Tweak visual mode highlights
  -- TODO: Tweak telescope borders
  -- TODO: Tweak flash label colors
end

return {
  {
    'Luxed/ayu-vim',
  },
  {
    'RRethy/nvim-base16',
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
      -- TODO: Look for a cool light theme to use here
      set_light_mode = function()
        vim.cmd("set termguicolors")
        vim.api.nvim_set_option("background", "dark")
        -- vim.cmd("colorscheme ayu")
        updateColors(true)
      end,
    },
  }
}
