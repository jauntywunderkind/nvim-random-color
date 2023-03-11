local colorschemesAll = vim.fn.getcompletion("", "color")
local randomScheme = colorschemesAll[ math.random( #colorschemesAll ) ]
vim.cmd("colorscheme " .. randomScheme)
-- todo: make this configurable
-- ref: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/config.lua
print(randomScheme)
