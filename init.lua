vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("keymap")

Colors = {}
function SetBaseColors(light)
  Colors = {
    red = '#ff453a',
    yellow = '#ffd60a',
    cyan = '#5ac8f5',
    magenta = '#bf3fbd',
  }
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
