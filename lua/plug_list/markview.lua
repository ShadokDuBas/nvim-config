return {
  "OXY2DEV/markview.nvim",
  lazy = false,      -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway
  priority = 49,
  config = function()
    require("markview").setup{
      preview = {
        hybrid_modes = {"n"}
      }
    }
  end,
}
