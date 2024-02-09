return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      autotrigger = true,
      keymap = {
        accept = "<leader>ia",
        accept_word = "<leader>iw",
        accept_line = "<leader>ii",
        next = "]i",
        prev = "[i",
        dismiss = "<leader>id",
      }
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
    },
  },
  init = function()
    require('which-key').register({
      ['<leader>i'] = { 'AI Copilot' },
      ['<leader>ia'] = { '[A]ccept Suggestion' },
      ['<leader>iw'] = { 'Accept [W]ord' },
      ['<leader>ii'] = { 'Accept Line' },
      ['<leader>id'] = { '[D]ismiss Suggestion' },
      ['[i'] = { 'Previous AI Suggestion' },
      [']i'] = { 'Next AI Suggestion' },
    })
  end
}
