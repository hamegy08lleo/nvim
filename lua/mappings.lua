local wk = require('which-key')

wk.register({ 
	e = { 
		":Neotree toggle<cr>", "File Explorer"
	}
}, 
{
	prefix = " "
}
	)

wk.register({ 
	t = { 
		":FloatermToggle<cr>", "Terminal"
	}
},
{
	prefix = " "
}
	)


wk.register({
	[" "] = { 
		c = {
			name = "Compile",
			c = { ":!g++ % && ./a.out <cr>", "Normal CPP" },
			p = { ":!g++ -Dhvmegy -O2 -o %:r.o % && ./%:r.o <cr>", "CP" }
		}
	}
}
)

wk.register({ 
	[" "] = { 
		f = {
			name = "Find", 
			f = {":Telescope find_files<cr>", "Files"},
		}
	}
})

vim.keymap.set('n', '<F3>', 'ggVG"+p')
vim.keymap.set('n', '<F2>', 'ggVG"+y')
