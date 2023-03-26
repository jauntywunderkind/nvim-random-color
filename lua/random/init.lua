local M = {}

function M.random()
	local colorschemesAll = vim.fn.getcompletion("", "color")
	local randomIndex = math.random( #colorschemesAll )
	local randomScheme = colorschemesAll[ randomIndex ]
	vim.cmd.colorscheme(randomScheme)
	-- todo: make this configurable
	-- ref: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/config.lua
	print(randomScheme)
	return randomScheme
end

return M
