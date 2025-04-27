-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local plugins = {
 {
		'nvim-telescope/telescope.nvim', version = '0.1.8',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
    {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	'nvim-treesitter/playground',
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'neovim/nvim-lspconfig'
}
require("lazy").setup(plugins, {})
