
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
	"williamboman/mason.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"neovim/nvim-lspconfig",
    },
    config = function()
        local mason = require("mason")
	mason.setup()

	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
            automatic_installation = true,
            ensure_installed = {
                "cssls",
                "eslint",
                "html",
                "jsonls",
                "ts_ls",
                "pyright",
                "tailwindcss",
            },
        })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "black",
        "isort",
        "pylint",
        "prettier",
        "eslint_d",
      },
    })

    end,
}
