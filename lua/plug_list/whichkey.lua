local opts ={
    preset = "helix",
  }


return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = opts,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    require("which-key").setup(opts)
    require("which-key").add({
      {"<leader>o", group="Org-mode", icon= ""},
      {"<leader>s", group="Telescope", icon= " "},
      {"<leader>w", proxy="<c-w>", group="Windows"},
      {"ZZ", desc="Save and quit"},
      {"ZQ", desc="Force [Q]uit"},
    })
  end,
}
