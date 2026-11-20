-- Pas exécuté il semblerait
-- vim.notify("coucou, je suis executé")
-- vim.api.nvim_create_autocmd('FileType', {
--       pattern = { 
--         "*.sh",
--         "*.bib",
--         "*.c",
--         "*.lisp",
--         "*.fish",
--         "*.java",
--         "*.json",
--         "*.ledger",
--         "*.lua",
--         "*.md",
--         "*.nix",
--         "*.nu",
--         "*.ml",
--         "*.mli",
--         "*.py",
--         "*.rs",
--         "*.toml",
--         "*.typ",
--         "*.yaml",
--         },
--       callback = function() vim.treesitter.start() end,
-- })
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",  -- This is critical for Neovim 0.12!
  config = function()
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  opts = {
    indent = { enable = true },
    highlight = { enable = true },
    folds = { enable = true },
  },
}
