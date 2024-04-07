vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw and use neotree instead
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("keymap")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

require('keymap-lazy')
--           symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ', },
vim.cmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
vim.cmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn")
vim.cmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo")
vim.cmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint")

vim.cmd("set signcolumn=yes:2")

UpdateColors()

-- Add grammars for custom languages
require "nvim-treesitter.parsers".get_parser_configs().goto = {
  install_info = {
    url = "https://github.com/goto-lang/tree-sitter-goto",
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "main",
  },
  filetype = "goto", -- if filetype does not match the parser name
}
vim.filetype.add { extension = { goto = 'goto' } }

