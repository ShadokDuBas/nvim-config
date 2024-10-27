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

local commande = s(
  {
    trig="\\/",
    snippetType="autosnippet",
  },
  {
    t("\\"),
    i(1),
    t("{"),
    i(2),
    t("}"),
  })

local itemize = s({trig=".eit", snippetType="autosnippet",},
  fmta(
[[\begin{itemize}
  \item <>
\end{itemize}]], 
  {i(1)}),
  {condition = line_begin}
  )

local enumerate = s({trig=".enu", snippetType="autosnippet",},
  fmta(
[[\begin{enumerate}
  \item <>
\end{enumerate}]], 
  {i(1)}),
  {condition = line_begin}
  )

local envir = s({trig=".beg", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  ),
  {condition = line_begin}
),


table.insert(snips, commande)
table.insert(snips, itemize)
table.insert(snips, enumerate)
table.insert(snips, envir)

return snips
