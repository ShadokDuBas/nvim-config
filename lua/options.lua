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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- considérer que tex = latex
vim.g.tex_flavor = "latex"

-- ne pas autoriser le concealer latex
-- le plugin Markview.lua remet cette option à 2 quand on ouvre
-- un fichier md.
vim.opt.conceallevel = 0

-- fermer le buffer sans fermer la fenêtre
vim.keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", 
  {desc = "[q]uit buffer, but keep window"})

-- Chercher-remplacer le mot sous le curseur
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], 
  {desc = "search and [R]eplace word under cursor"})
