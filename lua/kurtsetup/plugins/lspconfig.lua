return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
	"williamboman/mason-lspconfig.nvim",
    	"williamboman/mason.nvim",
    },
    config = function()
        local nvim_lsp = require("lspconfig")

	local on_attach = function(client, bufnr)
            -- format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        nvim_lsp.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.html.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.eslint.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
        nvim_lsp.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        })
    end,
}
