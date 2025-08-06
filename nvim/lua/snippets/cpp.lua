local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("q1", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "int main() {",
      "  ios::sync_with_stdio(0);",
      "  cin.tie(nullptr);",
      "",
      "  ",
    }),
    i(0),
    t({
      "   ",
      "",
      "  return 0;",
      "}",
    }),
  }),

  s("qt", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "void solve() {",
      "  ",
    }),
    i(0),
    t({
      "  ",
      "}",
      "",
      "int main() {",
      "  ios::sync_with_stdio(0);",
      "  cin.tie(nullptr);",
      "",
      "  int t;",
      "  cin >> t;",
      "",
      "  while (t--) {",
      "    solve();",
      "  }",
      "",
      "  return 0;",
      "}",
    }),
  }),
})
