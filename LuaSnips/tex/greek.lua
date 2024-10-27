local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node

local letters = {}

local alpha = s({trig=";a", snippetType="autosnippet"},
  {
    t("\\alpha"),
  }
)

table.insert(letters, alpha)



return letters
