return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
        
     -- lspconfig.tsserver.setup({})

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP: Hover" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP: Code action" })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { 
          "lua_ls", 
          "rust_analyzer",
         -- "tsserver"
        },
      }
    end
  },
  }
