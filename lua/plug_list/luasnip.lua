return {
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
    vim.keymap.set({"n"}, "<leader>n", function() ls.expand() end, {silent = true, desc="expand snippet"})
    vim.keymap.set({"n", "s"}, "<leader>n", function() ls.jump( 1) end, {silent = true, desc="snippet jump"})
    vim.keymap.set({"n", "s"}, "<leader>p", function() ls.jump(-1) end, {silent = true, desc="back. snippet jump"})
    vim.keymap.set({"n", "s"}, "<leader>c", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true,desc="snippet select"})
    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnips/"})
  end,
}
