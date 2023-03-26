local M = {}

-- otherwise we get the same thing haha
math.randomseed(os.time())

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

local lastTimer = nil
local oldHeight = nil

-- print without making user hit enter key, by growing cmdheight sufficiently, temporarily
function M.print(color)
	if oldHeight and oldHeight >= 1 then
		-- it's already sufficiently large, don't adjust size, just print
		print(color)
		return
	elseif not lastTimer then
		-- first print, so capture height
		oldHeight = vim.o.cmdheight
	else
		-- reset the clock on resetting cmdheight
		lastTimer:stop()
	end

	-- create space for the print to appear in
	vim.o.cmdheight = 1
	vim.cmd.redraw()

	-- reset back eventually
	lastTimer = vim.defer_fn(function()
		vim.o.cmdheight = oldHeight
		oldHeight = nil
	end, 6000)

	-- print
	print(color)
end

function M.random(color)
	local color = color or M.choose()
	-- todo: make whether we print configurable
	-- ref: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/config.lua
	M.print(color)
end

return M
