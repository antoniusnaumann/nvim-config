return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      autotrigger = true,
      keymap = {
        accept = "<C-a>",
        accept_word = "<C-W>",
        accept_line = "<C-L>",
        next = "<C-[>",
        prev = "<C-]>",
        dismiss = "<C-D>",
      }
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
    },
  }, 
}
