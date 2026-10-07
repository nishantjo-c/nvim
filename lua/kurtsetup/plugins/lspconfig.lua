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

        vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("cssls", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("tailwindcss", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("jsonls", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("eslint", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("pyright", { on_attach = on_attach, capabilities = capabilities })
        vim.lsp.config("lua_ls", {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        })
    end,
}
