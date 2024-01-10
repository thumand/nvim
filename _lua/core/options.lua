-- Setting a local variable for vim.opt
local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 4 -- Spaces for tabs
opt.shiftwidth = 4 -- Spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Autoindent

-- Line wrapping
opt.wrap = false -- Disabled

-- Search settings
opt.ignorecase = true -- Ignore case when searching

-- Cursor line
opt.cursorline = true -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true
opt.background = "dark" -- Default colorscheme, when light and dark exists
opt.signcolumn = "yes" -- Sign column

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Python path 
vim.g.python3_host_prog = '/Users/michaelthumand/.pyenv/shims/python'
