
lua << EOF
	local wk = require("which-key")

	wk.register({
		-- already supplied by christoomey's vim tmux navigator
		-- ["<c-j>"] = {"<c-w><c-j>"},
		-- ["<c-k>"] = {"<c-w><l-k>"},
		-- ["<c-l>"] = {"<c-w><c-l>"},
		-- ["<c-h>"] = {"<c-w><c-h>"},
	}, { prefix = "<leader>", mode = "n" })

	wk.register({
		"J" = { ":move '<-2<CR>gv=gv" },
		"K" = { ":move '>+1<CR>gv=gv" },
	}, { prefix = "<leader>", mode = "x" })

EOF
