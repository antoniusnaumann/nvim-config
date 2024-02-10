local function updateColors(light)
  SetBaseColors(light)
  local c = require('base16-colorscheme')
  c.setup({
    base00 = Colors.bg,
    base01 = '#636366',     -- light gray, line selection in file explorer
    base02 = '#212124',     -- very dark gray, some bars
    base03 = '#48484a',     -- dark gray, comments
    base04 = '#aeaeb2',     -- very light gray, line numbers
    base05 = Colors.fg,     -- unhighlighted text
    base06 = Colors.cyan,   -- ???
    base07 = Colors.blue,   -- ???
    base08 = Colors.sky,    -- variables
    base09 = Colors.purple, -- number literals
    base0A = Colors.mint,   -- class names
    base0B = Colors.lime,   -- string literals
    base0C = Colors.yellow, -- warnings
    base0D = '#ffea80',     -- yellowish white, function calls
    base0E = Colors.orange, -- keywords
    base0F = Colors.red,    -- , commas
  }, {
    telescope_borders = true,
    lsp_semantic = true,
  })
  local colorscheme                 = require('colorscheme')
  local hi                          = colorscheme.highlight

  -- Override some syntax highlights
  local kw                          = { guifg = Colors.orange, guibg = nil, gui = 'bold', guisp = nil, ctermfg = c
  .colors.cterm0E, ctermbg = nil }
  hi.TSKeyword                      = kw
  hi.TSKeywordFunction              = kw
  hi.TSConditional                  = kw
  hi.TSInclude                      = kw

  local attr                        = { guifg = c.colors.base0D, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm0D, ctermbg = nil }
  hi.TSAnnotation                   = attr
  hi.TSAttribute                    = attr

  hi.TSError                        = { guifg = Colors.red, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors
  .cterm0F, ctermbg = nil }
  hi.TSLabel                        = { guifg = c.colors.base0F, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm0F, ctermbg = nil }
  hi.TSFuncMacro                    = { guifg = c.colors.base0C, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm0C, ctermbg = nil }
  hi.TSNamespace                    = { guifg = c.colors.base07, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm07, ctermbg = nil }
  hi.TSPunctDelimiter               = { guifg = c.colors.base0D, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm0D, ctermbg = nil }
  --- LSP highlighting
  hi['@lsp.type.typeParameter'] = { guifg = c.colors.base0B, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors.cterm0B, ctermbg = nil }
  hi['@lsp.type.interface'] = { guifg = c.colors.base09, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors.cterm09, ctermbg = nil }
  hi['@lsp.type.lifetime'] = { guifg = c.colors.base0F, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors0F, ctermbg = nil }
  hi["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error }

  local lib =  { guifg = c.colors.base06, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors.cterm06, ctermbg = nil }
  hi["@lsp.typemod.class.defaultLibrary"] = lib
  hi["@lsp.typemod.enum.defaultLibrary"] = lib
  hi["@lsp.typemod.struct.defaultLibrary"] = lib
  hi["@lsp.typemod.typeAlias.defaultLibrary"] = lib
  hi["@lsp.typemod.class.library"] = lib
  hi["@lsp.typemod.enum.library"] = lib
  hi["@lsp.typemod.struct.library"] = lib
  hi["@lsp.typemod.typeAlias.library"] = lib
  hi["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" }

  -- Diagnostics
  hi.DiagnosticError                = { guifg = Colors.red, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors
  .cterm0F, ctermbg = nil }
  hi.DiagnosticInfo                 = { guifg = Colors.sky, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors
  .cterm08, ctermbg = nil }
  hi.DiagnosticWarn                 = { guifg = Colors.yellow, guibg = nil, gui = 'none', guisp = nil, ctermfg = c
  .colors.cterm0C, ctermbg = nil }
  hi.DiagnosticHint                 = { guifg = Colors.mint, guibg = nil, gui = 'none', guisp = nil, ctermfg = c.colors
  .cterm0A, ctermbg = nil }
  hi.DiagnosticUnderlineError       = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = Colors.red, ctermfg = nil, ctermbg = nil }
  hi.DiagnosticUnderlineWarning     = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = Colors.yellow, ctermfg = nil, ctermbg = nil }
  hi.DiagnosticUnderlineWarn        = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = Colors.yellow, ctermfg = nil, ctermbg = nil }
  hi.DiagnosticUnderlineInformation = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = Colors.sky, ctermfg = nil, ctermbg = nil }
  hi.DiagnosticUnderlineHint        = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = Colors.mint, ctermfg = nil, ctermbg = nil }


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
