require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800; incomplete_delay = 600;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
		spell = true;
    -- nvim_lsp = true;
    -- nvim_lua = true;
    -- vsnip = true;
    ultisnips = true;
    -- luasnip = true;
  };
}

-- vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
-- vim.cmd [[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]]
vim.cmd [[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]]
vim.cmd [[inoremap <silent><expr> <C-n>     compe#scroll({ 'delta': +6 })]]
vim.cmd [[inoremap <silent><expr> <C-p>     compe#scroll({ 'delta': -6 })]]

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

_G.tab_undo_complete = function() 
  if vim.fn.pumvisible() == 1 then
    return vim.fn['compe#close']()
	else
		return t "<Esc>"
	end
end

_G.s_toggle_autocompe = function()
  if vim.fn.pumvisible() == 0 then
    return vim.fn['compe#complete']()
	else
    return vim.fn['compe#close']()
	end
end

_G.s_enter = function()
  if vim.fn.pumvisible() == 1 then
		print("yowwputanaman")
		vim.fn['UltiSnips#ExpandSnippet']()
    return vim.fn['compe#confirm']('<cr>')
	else
		print("cnarocorn")
		return t "<cr>"
	end
end


-- local ultiExpand = vim.g.ulti_expand_or_jump_res
-- _G.ultiExpandOrJump = function()
-- 	if vim.fn.pumvisible() == 1
-- 		local snippet = vim.fn['UltiSnips#ExpandSnippetOrJump']()
-- 		local res = vim.g.ulti_expand_or_jump_res
-- 		if res > 0
-- 			return snippet
-- 		else
-- 			return t "<cr>"
-- 		end
-- 	end
-- end

-- let g:ulti_expand_or_jump_res = 0 "default value, just set once
-- function! Ulti_ExpandOrJump_and_getRes()
--	 call UltiSnips#ExpandSnippetOrJump()
--	 return g:ulti_expand_or_jump_res
-- endfunctionv:lua.ultiExpandOrJump()
-- vim.cmd[[let g:ulti_expand_or_jump_res=0]]
-- _G.Ulti_ExpandOrJump_and_getRes = function ()
--   vim.cmd[[call UltiSnips#ExpandSnippetOrJump()]]
--   return vim.g.ulti_expand_or_jump_res
-- end

-- vim.cmd[[let g:UltiSnipsExpandTrigger='<cr>']]

vim.api.nvim_set_keymap("i", "<Esc>", "v:lua.tab_undo_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<cr>')", {expr = true, silent = true, noremap=true})
--vim.api.nvim_set_keymap("i", "<CR>", "v:lua.s_enter()", {expr = true, silent = true, noremap=true})
--vim.api.nvim_set_keymap("i", "<CR>", "<C-R>=(v:lua.Ulti_ExpandOrJump_and_getRes()>0)?'':''<CR>", {expr=false})
vim.api.nvim_set_keymap("i", "<C-Space>", "v:lua.s_toggle_autocompe()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

