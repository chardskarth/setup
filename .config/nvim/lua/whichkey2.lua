local wk = require("which-key")

function labelIsCommand(cmd) return { cmd, cmd }
end
function labelIsCommandCR(cmd) 
	return { cmd.."<cr>", cmd }
end

wk.setup({
   plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { ";", "<leader>", " " },
  },
})

wk.register({
	H = { "zc|", "Fold" },
	L = { "zo|", "Fold" },
	[">"] = { ":tabnext<CR>", "Next tab" },
	["<lt>"] = { ":tabprev<CR>", "Prev tab" },
	["}"] = { ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>','dont store in jumplist' },
	["{"] = { ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>','dont store in jumplist' },
	["ga"] = labelIsCommand("<Plug>(EasyAlign)"),
}, { mode = "n" })

wk.register({
	K = { ":move '<-2<CR>gv=gv", "Move lines up" },
	J = { ":move '>+1<CR>gv=gv", "Move lines down" },
	["ga"] = labelIsCommand("<Plug>(EasyAlign)"),
}, { mode = "x" })

wk.register({
	-- already supplied by christoomey's vim tmux navigator
	-- ["<c-j>"] = {"<c-w><c-j>"},
	-- ["<c-k>"] = {"<c-w><l-k>"},
	-- ["<c-l>"] = {"<c-w><c-l>"},
	-- ["<c-h>"] = {"<c-w><c-h>"},
	["<leader><leader>"] = labelIsCommandCR(':source %'),
	b = labelIsCommandCR(':BufferPick'),
	w = { name = "+window",
		n = labelIsCommandCR(':TilerNew'),
		r = labelIsCommandCR(':TilerReorder'),
		f = labelIsCommandCR(':TilerFocus'),
		x = labelIsCommandCR(':Bdelete'),
		s = { '<Plug>GoldenViewSplit', 'Golden view split' }
	},

	t = { ["name"] = "+toggle",
		g = { '<Plug>GoldenViewSwitchToggle', '' },
		t = { ':TagbarToggle', 'tiler new' },
		y = labelIsCommandCR(':Goyo'),
		["1"] = labelIsCommandCR(':set number!'),
		["2"] = labelIsCommandCR(':set rnu!'),
		["3"] = labelIsCommandCR(':call MyToggleLineNumber()'),
		["4"] = labelIsCommandCR(':call Toggle_transparent()'),
		e = { ':call MyNERDTreeTogglePreview()', 'Golden view split' }
	},

	f = { name = "+fzf",
		p = { ':FZF', '' },
		g = { ':GitFiles', 'tiler new' },
		b = { ':Buffers', 'tiler focus' },
		x = { ':BD', 'close window' }
	},

	l = { name = "+languageServer",
		s = { ':CocCommand snippets.editSnippets', '' },
		f = { '<Plug>(coc-codeaction-selected)', 'tiler new' },
		c = { '<Plug>(coc-codeaction)', 'tiler focus' },
		r = { '<Plug>(coc-references)', 'close window' }
	},

	z = { ["name"] = "+quickedits",
		["1"] = labelIsCommandCR(':Vimrc'),
		["2"] = labelIsCommandCR(':Vimplugins'),
		["3"] = labelIsCommandCR(':Vimkeys'),
		["4"] = labelIsCommandCR(':VimwikiConf'),
		["5"] = labelIsCommandCR(':Vimconf'),
		["6"] = labelIsCommandCR(':VimkeysOld'),
		c = labelIsCommandCR(':VimColors'),
		f = labelIsCommandCR(':VimFzfConf'),
		m = labelIsCommandCR(':Finances'),
		e = labelIsCommandCR(':VimQuickedits'),
		k = { ["name"] = "Wiki",
			g = labelIsCommandCR(':VimwikiHabits'),
			l = labelIsCommandCR(':VimQuickedits'),
		}
	},

	k = { ["name"] = "+viwiki",
		w = labelIsCommandCR(':call TypeVimWiki()'),
		k = labelIsCommandCR(':VimwikiIndex'),
		[">"] = labelIsCommandCR(':VimwikiMakeTomorrowDiaryNote'),
		["<"] = labelIsCommandCR(':VimikiDiaryPrevDay'),
		["."] = labelIsCommandCR(':VimwikiMakeDiaryNote'),
		r = labelIsCommandCR(':SundayReview'),
		p = labelIsCommandCR(':VimwikiFiles'),
		["/"] = { ["name"] = "+search vimwiki pages",
			p = labelIsCommandCR(':VimwikiSearchProject'),
			d = labelIsCommandCR(':VimwikiSearchDiary'),
			c = labelIsCommandCR(':VimwikiSearchCheckins'),
			l = labelIsCommandCR(':VimwikiLines'),
			w = labelIsCommandCR(':VimwikiSearchWCProjects'),
			y = labelIsCommandCR(':VimwikiSearchWeekly'),
		}
	},

	e = { ["name"] = "+nerdtree",
		e = labelIsCommandCR(':NERDTreeToggle'),
		f = labelIsCommandCR(':NERDTreeFind'),
	},

}, { prefix="<leader>", mode="n" })

wk.register({
	-- already supplied by christoomey's vim tmux navigator
	-- ["<c-j>"] = {"<c-w><c-j>"},
	-- ["<c-k>"] = {"<c-w><l-k>"},
	-- ["<c-l>"] = {"<c-w><c-l>"},
	-- ["<c-h>"] = {"<c-w><c-h>"},
	r = labelIsCommand(""),
	w = { "<esc>:noh<cr>:w<cr>", "Write" },
	["ef"] = labelIsCommandCR(":NERDTreeFind"),
	H = { "zm|", "Decrease fold level" },
	L = { "zr|", "Increase fold level" },
	j = labelIsCommandCR("<esc>:call MyJumpMove()")
}, { prefix = "<leader>;", mode = "n" })

wk.register({
		p = labelIsCommandCR(":VimwikiProjectMove"),
		[">"] = labelIsCommandCR(":VimwikiDiaryTomorrowMove"),
		k = labelIsCommandCR(":VimwikiDiaryMove")
}, { prefix = "<leader>kl", mode = "x" })

wk.register({
		[";w"] = labelIsCommandCR("<esc>:w<cr>"),
		[";j"] = labelIsCommandCR("<esc>:call MyJumpMove()"),
}, { prefix = "<leader>", mode = "i" })

-- vim.cmd [[inoremap <leader>;w <Esc>:w<CR>]]
-- vim.cmd [[inoremap <leader>;j <Esc>:call MyJumpMove()<CR>]]
