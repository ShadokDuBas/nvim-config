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

local kanagawa = { 
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  }

-- Treesitter
local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = 
          { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "markdown_inline",
          --"latex" 
          },
        auto_install = true,
        disable = {'org'},
        ignore_install = { 'org' },
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>v",
            node_incremental = "<Leader>i",
            node_decremental = "<Leader>d"
          },
        },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
          },
        },
      })
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  }

local treesitter_textobjects = {"nvim-treesitter/nvim-treesitter-textobjects"}

-- fugitive : manipuler git
local fugitive = {"tpope/vim-fugitive"}

-- focus : resize windows on the fly
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

    require("mini.align").setup()
  end,}

-- flash : sauteeeer
local flash = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader><leader>", mode = { "n", "x", "o" }, function()
      require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function()
      require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function()
      require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function()
      require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function()
      require("flash").toggle() end, desc = "Toggle Flash Search" },
  },

  config = function()
    require("flash").setup({
      highlight = {matches = false,},
    })
  end,
}

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
local neorg = {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            journal = "~/journal",
          },
          default_workspace = "journal",
        },
      },
    },
  },
  }


-- nvim-notify : notifications
local notif = {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
  end,
}

-- pomo : timers
local pomodoro = {
  "epwalsh/pomo.nvim",
  version = "*",  -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  opts = {
  },
}

-- Noice : remake the ui of vim
local nice = {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
    },
}

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
local snips = {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!). (opted out)
	-- build = "make install_jsregexp"
  config = function()
    require("luasnip").config.set_config({
      enable_autosnippets = true,
      --store_selection_keys = "<Tab>",
      updateevents = "TextChanged,TextChangedI",
    })
    local ls = require("luasnip")
    vim.keymap.set({"n"}, "<leader>n", function() ls.expand() end, {silent = true})
    vim.keymap.set({"n", "s"}, "<leader>n", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"n", "s"}, "<leader>p", function() ls.jump(-1) end, {silent = true})
    vim.keymap.set({"n", "s"}, "<leader>c", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnips/"})
  end,
}



-- Org-mode
local orgmode = {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      win_split_mode = "vertical",
      org_capture_templates =
        { t = { description = 'Task', template = '* TODO %?\n  %u' },
          s = { 
            description = "schedule", 
            template = "* %?\n  SCHEDULED: %^{date}T\n  %u"},
        },
      mappings = {
        agenda = {
          org_agenda_later = '>',
          org_agenda_earlier = '<',
          org_agenda_goto_today = {'.', 'T'},
          org_agenda_priority_up = nil,
          org_agenda_priority_down = nil,
          org_agenda_todo = {"t", "<leader>ot"},
        },
        capture = {
          org_capture_finalize = '<Leader>w',
        }
      },
    })
    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}


-- liste des plugins à rajouter :
-- oil ? mini.files ?
-- luasnips / autocomplete ?
-- telescope
-- vim-latex ?
-- folke/noice.nvim

require("lazy").setup({
  kanagawa,
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
})

