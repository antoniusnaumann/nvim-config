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

-- -- Add grammars for custom languages
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.goto = {
--   install_info = {
--     url = "https://github.com/tree-sitter/tree-sitter-go",
--     files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
--     -- optional entries:
--     branch = "main", -- default branch in case of git repo if different from master
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = "goto", -- if filetype does not match the parser name
-- }

