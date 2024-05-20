return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority= 1000,
    opts = {
      transparent_background = true,
    },
    config = function()
    vim.cmd.colorscheme "catppuccin"
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
    vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
    vim.cmd("highlight Folded guibg=NONE ctermbg=NONE")
    vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
   end
}
