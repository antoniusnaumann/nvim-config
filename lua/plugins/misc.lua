return { 'folke/which-key.nvim', opts = {
  event = "VeryLazy",
  init = function()
    print("init")
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,   
} }
