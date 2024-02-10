vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("keymap")

Colors = {}
function SetBaseColors(light)
  if light then
    -- TODO: edit light mode colors
    Colors = {
      bg = '#fafafa',
      fg = '#f2f2f7',
      red = '#ff453a',
      orange = '#ff9f0a',
      yellow = '#ffd60a',
      lime = '#7dd70f',
      mint = '#41d496',
      cyan = '#5ac8f5',
      purple = '#d189f5',
      magenta = '#bf3fbd',
    }
  else
    Colors = {
      bg = '#1c1c1e',
      fg = '#f2f2f7',
      red = '#ff453a',
      orange = '#ff9f0a',
      yellow = '#ffd60a',
      lime = '#7dd70f',
      mint = '#41d496',
      cyan = '#5ac8f5',
      purple = '#d189f5',
      magenta = '#bf3fbd',
    }
  end
end

SetBaseColors(false)

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
