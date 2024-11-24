local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snips = {}
local notify = false

local fun = function(_, snip)
  if notify then vim.notify("closed the bracket") end
  return snip.captures[1]
end

local subscript = 
s({trig = '_([^_ %^{}]-)}', snippetType="autosnippet", regTrig = true, wordTrig = false},
  fmta(
    [[_{<><>}]],
    {
      f( fun ),
      i(1),
    }
  )
)

local supscript = 
s({trig = '%^([^_ %^{}]-)}', snippetType="autosnippet", regTrig = true, wordTrig = false},
  fmta(
    [[^{<><>}]],
    {
      f( fun ),
      i(1),
    }
  )
)

table.insert(snips, subscript)
table.insert(snips, supscript)


return snips
