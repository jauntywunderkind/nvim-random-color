local colorschemesAll = vim.fn.getcompletion({ "", "color", 0 })
local randomSchemeIndex = colorschemesAll[ math.random( #colorschemesAll ) ]
print(randomSchemeIndex)
print(colorschemesAll[randomSchemeIndex])
