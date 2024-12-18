-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Window splitting behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- No line wrapping
vim.opt.wrap = false

-- ligne à 80 chars
vim.opt.textwidth = 80

-- Tabulations shenanigans
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Supposed to synchronise
-- vim’s and system’s clipboard
vim.opt.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scroll before reaching edge of window
vim.opt.scrolloff = 10

-- Allows for nice block selection
vim.opt.virtualedit = "block"

-- View modifications on another window, eg in a search and replace
vim.opt.inccommand = "split"

-- Allows for command autocomplete
vim.opt.ignorecase = true

-- Use the true colors of the screen
vim.opt.termguicolors = true

-- Leader : space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Signcolumn, used to display signs(???)
vim.opt.signcolumn = "yes"


-- considérer que tex = latex
vim.g.tex_flavor = "latex"

-- ne pas autoriser le concealer latex
-- le plugin Markview.lua remet cette option à 2 quand on ouvre
-- un fichier md.
vim.opt.conceallevel = 0



