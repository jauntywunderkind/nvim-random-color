local M = {}

-- find a random color --- but don't set
function M.pick()
	local colorschemesAll = vim.fn.getcompletion("", "color")
	local randomIndex = math.random( #colorschemesAll )
	local color = colorschemesAll[ randomIndex ]
	return color
end

-- set a random color
function M.choose(color)
	color = color or M.pick()
	-- the color doesn't work unless we defer
	vim.defer_fn(function()
		vim.cmd.colorscheme(color)
	end, 0)
	return color
end

-- print without making user hit enter key
function M.print(color)
	local oldHeight = vim.o.cmdheight
	if oldHeight < 1 then
		-- create space for the print to appear in
		vim.o.cmdheight = 1
		vim.cmd.redraw()
		vim.defer_fn(function()
			-- reset back eventually
			vim.o.cmdheight = oldHeight
		end, 6000)
	end
	print(color)
end

function M.random(color)
	local color = color or M.choose()
	-- todo: make whether we print configurable
	-- ref: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/config.lua
	M.print(color)
end

return M
