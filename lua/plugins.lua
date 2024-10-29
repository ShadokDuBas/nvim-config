-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or 
--    https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ 
    "git", 
    "clone", 
    "--filter=blob:none", 
    "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Themes :

local kanagwa = require("plug_list.kanagwa")

-- Treesitter
local treesitter = require("plug_list.treesitter")

local treesitter_textobjects = {"nvim-treesitter/nvim-treesitter-textobjects"}

-- fugitive : manipuler git
local fugitive = {"tpope/vim-fugitive"}

-- focus : resize windows automatically
local focus = { 
  'nvim-focus/focus.nvim',
  version = false,
  config = function()
    require("focus").setup()
  end,
}

-- which-key : keymaps reminder
local which_key = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

-- mini.nvim : petits plugins variés
local minis = { 'echasnovski/mini.nvim', 
  version = false,
  config = function()
    -- Better Around/Inside textobjects
    require("mini.ai").setup({ n_lines = 500 })
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require("mini.surround").setup()
    -- Simple and easy statusline.
    -- require("mini.statusline").setup()
    -- animations!!!
    require("mini.animate").setup({
    scroll = {enable=false},})
    -- Icon provider
    require("mini.icons").setup()
    -- use ga<object>s to align arround char s
    require("mini.align").setup()
  end,}

-- flash : sauteeeer
local flash = require("plug_list.flash")

-- lualine : status line
local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
    })
  end,
}


-- neorg : org tool
-- local neorg = require("plug_list.neorg")


-- nvim-notify : notifications
local notif = {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
  end,
}

-- pomo : timers
local pomodoro = require("plug_list.pomodoro")

-- Noice : remake the ui of vim
-- local nice = require("plug_list.nice")

-- markview : md renderer
local md = {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    }
}

-- luasnips : faire des snippets
local snips = require("plug_list.luasnip")

-- Telescope : fuzzy finder
local telsc =   require("plug_list.telesc")

-- Org-mode
local orgmode = require("plug_list.orgmode")


-- liste des plugins à rajouter :
-- oil ? mini.files ?
-- luasnips / autocomplete ?
-- telescope
-- vim-latex ?
-- folke/noice.nvim

require("lazy").setup({
  kanagwa,
  treesitter,
  treesitter_textobjects,
  fugitive,
  focus,
  which_key,
  minis,
  flash,
  lualine,
  --neorg,
  notif,
  pomodoro,
  --nice,
  md,
  snips,
  orgmode,
  telsc,
})

