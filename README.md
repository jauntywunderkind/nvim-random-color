# nvim-random-color

> Pick a random neovim color

Lua implementation of a random color picker.

# Implementation

Powered by neovim itself, by asking for completion of all colors (`vim.fn.getcomplete({ "", "color" })`).

By compare, many random-colorscheme plugins try to walk the file-system themselves.

Given how configurable neovim is, and how many directories might need to be walked, and for forward compatibility (for ex: neovim's excellent new [`$NVIM_APP`](https://github.com/neovim/neovim/pull/22128) capability), it's simpler & safer to just ask neovim what themes are available.
