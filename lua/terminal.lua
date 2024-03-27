require'FTerm'.setup({
	border = 'single',
	dimensions  = {
		height = 0.8,
		width = 0.8,
	},
	blend = 0,
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
