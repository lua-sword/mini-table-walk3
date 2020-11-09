
local table_walk = require "mini-table-walk3"

local x = {a = { b = { c = "abc"} } }
local pathok = {"a",  "b", "c", "d"}
local pathko = {"a",  "B", "c", "d"}
assert( table_walk(x, pathko) == nil)
assert( table_walk(x, {"a", "b", "c"}) == "abc")
assert( table_walk(x, pathok) == nil)
assert( table_walk(x, {"a", "b"}) == x.a.b)

assert( table_walk(x, pathok, 0) == x)
assert( table_walk(x, pathok, 1) == x.a)
assert( table_walk(x, pathok, 2) == x.a.b)
assert( table_walk(x, pathok, 3) == x.a.b.c)
assert( table_walk(x, pathok, 4) == x.a.b.c.d)
assert( table_walk(x, pathok, 5) == x.a.b.c.d)

assert( table_walk(x, pathok, -0) == x)
assert( table_walk(x, pathok, -1) == x.a.b.c.d)
assert( table_walk(x, pathok, -2) == x.a.b.c)
assert( table_walk(x, pathok, -3) == x.a.b)
assert( table_walk(x, pathok, -4) == x.a)
assert( table_walk(x, pathok, -5) == x)
assert( table_walk(x, pathok, -6) == x)

assert( table_walk(x, pathko, 0) == x)
assert( table_walk(x, pathko, 1) == x.a)
assert( table_walk(x, pathko, 2) == nil)
assert( table_walk(x, pathko, 3) == nil)

assert( table_walk(x, pathko, -1) == nil)
assert( table_walk(x, pathko, -2) == nil)
assert( table_walk(x, pathko, -3) == nil)
assert( table_walk(x, pathko, -4) == x.a)
assert( table_walk(x, pathko, -5) == x)
