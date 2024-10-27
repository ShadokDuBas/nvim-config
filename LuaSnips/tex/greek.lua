local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node

local letters = {}

local paires = {
  {",a", "\\alpha"},
  {",b", "\\beta"},
  {",c", "\\chi"},
  {",d", "\\delta"},
  {",e", "\\varepsilon"},
  {",f", "\\varphi"},
  {",g", "\\gamma"},
  {",h", "\\eta"},
  {",i", "\\iota"},
  {",k", "\\kappa"},
  {",l", "\\lambda"},
  {",m", "\\mu"},
  {",n", "\\nu"},
  {",o", "\\omicron"},
  {",p", "\\pi"},
  {",q", "\\theta"},
  {",r", "\\rho"},
  {",s", "\\sigma"},
  {",t", "\\tau"},
  {",u", "\\upsilon"},
  {",v", "\\varsigma"},
  {",w", "\\omega"},
  {",x", "\\xi"},
  {",y", "\\psi"},
  {",z", "\\zeta"},
  {",A", "\\Alpha"},
  {",B", "\\Beta"},
  {",C", "\\Chi"},
  {",D", "\\Delta"},
  {",E", "\\Varepsilon"},
  {",F", "\\Varphi"},
  {",G", "\\Gamma"},
  {",H", "\\Eta"},
  {",I", "\\Iota"},
  {",K", "\\Kappa"},
  {",L", "\\Lambda"},
  {",M", "\\Mu"},
  {",N", "\\Nu"},
  {",O", "\\Omicron"},
  {",P", "\\Pi"},
  {",Q", "\\Theta"},
  {",R", "\\Rho"},
  {",S", "\\Sigma"},
  {",T", "\\Tau"},
  {",U", "\\Upsilon"},
  {",V", "\\Varsigma"},
  {",W", "\\Omega"},
  {",X", "\\Xi"},
  {",Y", "\\Psi"},
  {",Z", "\\Zeta"},
}

local pair_to_snip = function(x,y)
  return s(
    { trig=x,
      -- dscr=string.strsub(y, 3),
      snippetType="autosnippet"
    },
    {t(y),})
end

for i,p in pairs(paires) do
  local x, y = p[1], p[2]
  table.insert(letters, pair_to_snip(x,y))
end

--
-- s({trig=";a", snippetType="autosnippet"},
--   {
--     t("\\alpha"),
--   }
-- )
--
-- table.insert(letters, alpha)



return letters
