local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = desc .. ' (LSP)'
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>r', vim.lsp.buf.rename, '[R]ename')
  nmap('<leader>a', function()
    vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  end, 'Code [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>T', require('telescope.builtin').lsp_type_definitions, '[T]ype Definition')
  nmap('<leader>Y', require('telescope.builtin').lsp_document_symbols, 'Search S[y]mbol in Document')
  nmap('<leader>y', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Search S[y]mbol in Workspace')

  -- See `:help K` for why this keymap
  nmap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<leader>f', vim.lsp.buf.format, 'Format')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>Wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>Wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>Wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return {
  { "folke/neodev.nvim", opts = {} },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP installer
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- Pest grammar LSP
      'pest-parser/pest.vim',
    },
    init = function()
      -- document existing key chains
      require('which-key').register {
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        -- ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        -- ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>W'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]indow Management', _ = 'which_key_ignore' },
      }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })

      -- mason-lspconfig requires that these setup functions are called in this order
      -- before setting up the servers.
      require('mason').setup()
      require('mason-lspconfig').setup()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      --
      --  If you want to override the default filetypes that your language server will attach to you can
      --  define the property 'filetypes' to the map in question.
      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },

        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
        ['pest_ls'] = function()
          require('pest-vim').setup {}
        end,
      }

      -- require 'lspconfig'.rust_analyzer.setup {
      --   cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
      --   init_options = {
      --     lspMux = {
      --       version = "1",
      --       method = "connect",
      --       server = "/usr/local/bin/rust-analyzer",
      --     },
      --   },
      -- }
      require 'lspconfig'.mojo.setup {}
    end
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    ft = { "mojo" },
    opts = function(_, opts)
      vim.treesitter.language.register("python", "mojo")

      opts.indent = { disable = true }
      -- opts.highlight.additional_vim_regex_highlighting = true

      return opts
    end,
    build = ':TSUpdate',
    init = function()
      vim.defer_fn(function()
        require('nvim-treesitter.configs').setup {
          -- Add languages to be installed here that you want installed for treesitter
          ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

          -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
          auto_install = true,
          -- Install languages synchronously (only applied to `ensure_installed`)
          sync_install = false,
          -- List of parsers to ignore installing
          ignore_install = {},
          -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
          modules = {},
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<c-space>',
              node_incremental = '<c-space>',
              scope_incremental = '<c-s>',
              node_decremental = '<M-space>',
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = 'parameter (outer)',
                ['ia'] = 'parameter (inner)',
                ['af'] = 'function (outer)',
                ['if'] = 'function (inner)',
                ['ac'] = 'class (outer)',
                ['ic'] = 'class (inner)',
              },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                [']m'] = 'function',
                [']c'] = 'class',
              },
              goto_next_end = {
                [']M'] = 'function end',
                [']C'] = 'class end',
              },
              goto_previous_start = {
                ['[m'] = 'function',
                ['[c'] = 'class',
              },
              goto_previous_end = {
                ['[M'] = 'function end',
                ['[C'] = 'class end',
              },
            },
            swap = {
              enable = true,
              swap_next = {
                ['<leader>p'] = '@parameter.inner',
              },
              swap_previous = {
                ['<leader>P'] = '@parameter.inner',
              },
            },
          },
        }
      end, 0)
    end
  },

  -- Mojo language support
  {
    "igorgue/mojo.vim",
    -- dir = "~/Code/mojo.vim",
    ft = { "mojo" },
    init = function()
      local function format_mojo()
        local util = require("lazyvim.util")

        if util.format.enabled() then
          vim.cmd("noa silent! !mojo format --quiet " .. vim.fn.expand("%:p"))
        end
      end

      -- TODO: Fix this, runs on buf write pre and that shows an error
      -- this also sets it up for all type of files which is not good
      -- require("lazyvim.util").on_very_lazy(function()
      --   require("lazyvim.plugins.lsp.format").custom_format = function(_)
      --     format_mojo()
      --     return true
      --   end
      -- end)

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = { "*.🔥", "*.mojo" },
        nested = true,
        callback = format_mojo,
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local ns = vim.api.nvim_create_namespace("mojo")

          vim.api.nvim_set_hl_ns(ns)

          vim.api.nvim_set_hl(ns, "@variable.python", {})
          vim.api.nvim_set_hl(ns, "@error.python", {})
          vim.api.nvim_set_hl(ns, "@repeat.python", {})
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mojo",
        callback = function()
          vim.bo.expandtab = true
          vim.bo.shiftwidth = 4
          vim.bo.softtabstop = 4
          vim.bo.tabstop = 4
          vim.bo.commentstring = "# %s"
        end,
      })
    end,
  },
}
