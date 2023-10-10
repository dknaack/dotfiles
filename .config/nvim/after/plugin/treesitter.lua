require('nvim-treesitter.configs').setup {
	highlight = { enable = true },
	ensure_installed = {
		c,
		cpp,
		javascript,
		typescript,
		go,
		html,
		css,
		vim,
		vimdoc,
		markdown
	},
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},
}
