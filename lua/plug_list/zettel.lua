return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker= "telescope",
    })
    vim.keymap.set("n", "<leader>zi", "<cmd>ZkInsertLink", {desc="[Z]k [I]nsert link"})
    vim.keymap.set("n", "<leader>zn", "<cmd>ZkLinks", {desc="[Z]k [N]ext"})
    vim.keymap.set("n", "<leader>zp", "<cmd>ZkBackLinks", {desc="[Z]k [P]revious"})
  end
}
