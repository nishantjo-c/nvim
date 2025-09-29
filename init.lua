<<<<<<< Updated upstream

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
require("lazy").setup("plugins")



=======
vim.env.PATH = "/home/nishant/.npm-global/bin:" .. vim.env.PATH
require("kurtsetup.map")
require("kurtsetup.settings")
require("kurtsetup.lazy")
>>>>>>> Stashed changes
