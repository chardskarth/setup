
"       ___                                                         ___           ___           ___     
"      /__/\          ___                  ___        ___          /__/\         /  /\         /  /\    
"     |  |::\        /__/|                /__/\      /  /\        |  |::\       /  /::\       /  /:/    
"     |  |:|:\      |  |:|                \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/     
"   __|__|:|\:\     |  |:|                 \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___ 
"  /__/::::| \:\  __|__|:|             ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"	 \  \:\~~\__\/ /__/::::\            /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"   \  \:\          ~\~~\:\           \  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/ 
"    \  \:\           \  \:\           \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/  
"     \  \:\           \__\/            \__\::::/      \__\/      \  \:\        \  \:\        \  \::/   
"      \__\/                                ~~~~                   \__\/         \__\/         \__\/     
" 

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif  
" 
" source $HOME/.config/nvim/plugins.vim
" 
" source $HOME/.config/nvim/config/general_and_my_fns.vim
" "source $HOME/.config/nvim/config/airline.vim
" source $HOME/.config/nvim/config/coc.vim
" source $HOME/.config/nvim/config/start-up.vim
" source $HOME/.config/nvim/config/fzf.vim
" source $HOME/.config/nvim/config/vem-tabline.vim
" source $HOME/.config/nvim/config/localvimrc.vim
" "source $HOME/.config/nvim/config/whichkey.vim
" source $HOME/.config/nvim/config/vim-startify.vim
" source $HOME/.config/nvim/config/vim-pbcopy.vim
" source $HOME/.config/nvim/config/vim-gtd.vim
" source $HOME/.config/nvim/config/vim-libmodal.vim
" source $HOME/.config/nvim/config/nerdtree.vim
" source $HOME/.config/nvim/config/language-configs.vim
" source $HOME/.config/nvim/config/tagbar.vim

let mapleader = " "

lua << EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd[[filetype plugin indent off]]

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Simple plugins can be specified as strings use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    -- 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    -- requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use { 'tjdevries/colorbuddy.vim' }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  -- Aesthetics
  use { 'joshdick/onedark.vim' }
  use { 'thiagoalessio/rainbow_levels.vim' }

  use { 'christoomey/vim-tmux-navigator' }
  use { 'chardskarth/vimwiki' }
	use { 'junegunn/vim-easy-align' }
	use { 'folke/which-key.nvim' }
	use { 'tpope/vim-surround' }
	use { 'junegunn/fzf' }
	use { 'junegunn/fzf.vim' }
	use { 'scrooloose/nerdtree' }
	use { 'majutsushi/tagbar' }
	use { 'moll/vim-bbye' }
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'romgrk/doom-one.vim' }
	use { 'romgrk/barbar.nvim' }
	use { 'junegunn/goyo.vim' }
	use { 'junegunn/limelight.vim' }
	use { 'hrsh7th/nvim-compe' }
	use { 'hrsh7th/vim-vsnip' }
	use { 'SirVer/ultisnips' }
	use { 'honza/vim-snippets' }

end)
vim.cmd[[filetype plugin indent on]]

EOF
source  $HOME/.config/nvim/config/general_and_my_fns.vim
source  $HOME/.config/nvim/config/vimwiki.vim
source  $HOME/.config/nvim/config/colorscheme_vimrainbowlevels.vim
source  $HOME/.config/nvim/config/quickedits.vim
source  $HOME/.config/nvim/config/goyo.vim
luafile $HOME/.config/nvim/lua/whichkey2.lua
source	$HOME/.config/nvim/config/barbar.vim
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/nvim-compe.lua

let g:UltiSnipsExpandTrigger='<c-s>'
let g:UltiSnipsSnippetDirectories=['~/sources/chardskarth/setup/.config/nvim/snippets/UltiSnips']
let g:ulti_expand_or_jump_res = 0 "default value, just set once

function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
		echo g:ulti_expand_or_jump_res
    return g:ulti_expand_or_jump_res
endfunction
 
inoremap <C-s> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":""<CR>

