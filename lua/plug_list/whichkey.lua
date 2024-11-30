return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
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
  -- config = function()
  --   require("which-key").add({
  --     {"<leader>o", group="Org-mode", icon= ""},
  --     {"<leader>s", group="Telescope", icon= " "},
  --   })
  -- end,
}
