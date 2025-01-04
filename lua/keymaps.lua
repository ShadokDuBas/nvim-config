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
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })


-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- fermer le buffer sans fermer la fenêtre
vim.keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", 
  {desc = "[q]uit buffer, but keep window"})


-- Chercher-remplacer le mot sous le curseur
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], 
  {desc = "search and [R]eplace word under cursor"})


-- zen mode
vim.keymap.set("n", "<leader>zz", 
  function() 
    local ok, snack = pcall(require, "snacks") 
    if not ok then
      vim.notify("erreur dans le module zen :")
      vim.notify(snack)
    else snack.zen.zen()
    end
  end, 
  {desc="activate zen mode"})

vim.keymap.set("n", "s", "")

vim.keymap.set("n", "<leader>a", "q:<up>", {desc="[A]gain"})

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yygccp", {desc="[Y]ank > [C]omment", remap=true})

-- Note that ZZ is save and close (:x) and ZQ is :q!
-- Write
vim.keymap.set("n", "ZX", "<cmd>w<CR>", {desc="Save"})
-- Split
vim.keymap.set("n", "ZS", "<cmd>split<CR>", {desc="Horizontal [S]plit"})
vim.keymap.set("n", "ZV", "<cmd>vs<CR>", {desc="[V]ertical split"})
