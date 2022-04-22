vim.cmd('packadd packer.nvim')
return require('packer').startup(
  function()
   use 'wbthomason/packer.nvim'
   --startup-- 
   use 'glepnir/dashboard-nvim'
   use 'liuchengxu/vim-clap'
   --search--
   use 'kevinhwang91/nvim-hlslens'
   --scroll--
   use 'dstein64/nvim-scrollview'
   --format--
   use 'lukas-reineke/format.nvim'
   --discord--
   use 'andweeb/presence.nvim'
   --syntax--
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   --git--
   use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
   }
   --auto header --
   use 'shanzi/autoHEADER'
   --auto close tag
   use 'windwp/nvim-ts-autotag'
   --color codes --
   use 'norcalli/nvim-colorizer.lua'
   --comment--
 --  use 'numToStr/Comment.nvim' 
   --cursurline-- 
  use 'yamatsum/nvim-cursorline'
   --statusline--
   -- use 'ojroques/nvim-hardline'
   use 'NTBBloodbath/galaxyline.nvim'
   --indentline--
   use 'lukas-reineke/indent-blankline.nvim'
   --comp/snippets--
   use 'neovim/nvim-lspconfig'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-vsnip'
   use 'hrsh7th/vim-vsnip'
   use 'hrsh7th/vim-vsnip-integ'
   use 'rafamadriz/friendly-snippets' 
   --lsp--
   use 'ray-x/lsp_signature.nvim'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'folke/lsp-colors.nvim'
   use 'nanotee/sqls.nvim'
   use 'onsails/lspkind-nvim'
   use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
}   use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
    }
    use 'nvim-lua/lsp-status.nvim'
    use 'jubnzv/virtual-types.nvim'

    --file management
   use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
   }
   use {
   'nvim-telescope/telescope.nvim',
   requires = { {'nvim-lua/plenary.nvim'} }
   }
   use {
   'nvim-telescope/telescope-fzf-native.nvim',
   run = 'make',
   }
   --icons-- 
   use 'yamatsum/nvim-nonicons'
   --debug-- 
   use 'mfussenegger/nvim-dap' 
    --tmux width nvim --
   use 'aserowy/tmux.nvim'
   --Colorscheme syntax--
   use 'bluz71/vim-moonfly-colors'
   use 'mangeshrex/everblush.vim'
   -- nvim-transparent --
   --use 'xiyaowong/nvim-transparent'
   --session-- 
   use 'rmagatti/auto-session' 
 end
)
