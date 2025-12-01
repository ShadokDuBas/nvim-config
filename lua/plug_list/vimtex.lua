return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  config = function()
    -- VimTeX configuration goes here, e.g.
    -- vim.g.vimtex_view_method = "Okular" -- does not work ???
    -- vim.g.vimtex_view_general_options = "--new-window @pdf";
    vim.g.vimtex_view_general = "evince";
    
  end
}
