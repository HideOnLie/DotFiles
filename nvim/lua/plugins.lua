 -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').init({
    git = {
        default_url_format = 'git@github.com:%s'
    }
})

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Which-key
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
			}
			require("conf.which-key")
		end
	}

	-- Enhanced matchup(%)
	use {
		'andymass/vim-matchup',
		keys = '%',
		config = function()
			require("conf.matchup")
		end
	}

	-- Enhanced repeat(.)
	use {
		'tpope/vim-repeat',
		keys = '.',
	}

	-- Enhanced f/t/F/T
	use {
		'hrsh7th/vim-eft',
		disable = true,
	}

	-- Last place
	use {
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup{}
		end
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		run = ':TSUpdate',
	}

	-- Colorscheme
	use {
		'kristijanhusak/vim-hybrid-material',
		disable = true,
		config = function()
			require("conf.colorscheme.hybrid_material")
		end
	}
	use {
		'glepnir/zephyr-nvim',
		config = function()
			require("conf.colorscheme.zephyr")
		end
	}

	-- Dashboard
	use {
		"glepnir/dashboard-nvim",
		config = function()
			require("conf.dashboard")
		end
	}

	-- Rainbow bracket
	use {
		'p00f/nvim-ts-rainbow',
		after = {'nvim-treesitter'},
		config = function()
			require("conf.treesitter")
		end
	}

	-- Bufferline
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require'bufferline'.setup{}
		end
	}

	-- Galaxyline
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require'conf.statusline'
		end
	}

	-- Indent line
	use {
		"lukas-reineke/indent-blankline.nvim",
		disable = true,
	}

	-- Git
	use {
		'lewis6991/gitsigns.nvim',
		event = {'BufRead','BufNewFile'},
		config = function()
			require('gitsigns').setup()
		end
	}

	-- Comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'babaybus/DoxygenToolkit.vim',
		cmd = {'Dox', 'DoxLic', 'DoxAuthor'},
	}

	-- Symbol list
	use {
		'liuchengxu/vista.vim',
		cmd = 'Vista',
	}

	-- Mark
	use {
		'inkarkat/vim-mark',
		requires = {
			{
				'inkarkat/vim-ingo-library',
				-- opt = true,
				branch = 'stable',
				after = {'vim-mark'}
			}
		},
		-- keys = '<leader>m',
		branch = 'stable',
		setup = function()
			require'conf.mark'
		end
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Startup time
	use {
		'dstein64/vim-startuptime',
		disable = true,
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		after = "nvim-lsp-installer",
		requires = {
			{'williamboman/nvim-lsp-installer'},
		},
		config = function()
			require("nvim-lsp-installer").setup {
				automatic_installation = true,
			}
			local lspconfig = require("lspconfig")
			lspconfig.sumneko_lua.setup {}
			lspconfig.clangd.setup {}
		end
	}

	-- use {
	-- 	'glepnir/lspsaga.nvim',
	-- 	-- cmd = 'Lspsaga',
	-- 	-- config = function()
	-- 	-- 	local saga = require 'lspsaga'
	-- 	-- 	saga.init_lsp_saga()
	-- 	-- end
	-- }

	use {
		'L3MON4D3/LuaSnip'
	}

	use {
		'hrsh7th/nvim-cmp',
		-- event = 'InsertEnter',
		requires = {
			{'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig'},
			{'hrsh7th/cmp-path' , after = 'nvim-cmp'},
			{'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
			{'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
			{'saadparwaiz1/cmp_luasnip', after = "LuaSnip" },
			{'onsails/lspkind.nvim'},
			--{'saadparwaiz1/cmp_luasnip', after = "LuaSnip" },
		},
		after = {'lspkind.nvim', "cmp-nvim-lsp"},
		config = function()
			require("conf.nvim-cmp")
		end
	}


end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})


