return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = {
    filesystem = {
      hijack_netrw_behavior = 'open_current'
    },
    window = {
      mappings = {
        [Key_left] = "close_node",
        -- o clashes with "order" so just use arrow keys on a split keyboard with Colemak
        ['l'] = "open",
        ['left'] = "close_node",
        ['right'] = "open",
      }
    }
  }
}
