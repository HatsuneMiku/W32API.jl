# w32api_tests.jl

import W32API
using Formatting

println(format("[{:s}]", "test W32API"))
println(format("[{:08x}]", W32API.MBox("-bdy-", "ttl")))
println(format("[{:08x}]", W32API.MBox("bdy日本語漢字表示申能", "ttl表示申")))
println(format("[{:08x}]", W32API.MBoxA("-bdy-", "ttl")))
println(format("[{:08x}]", W32API.MBoxA("bdy日本語漢字表示申能", "ttl表示申")))
wt = Array{UInt16, 1}([0x0074, 0x0074, 0x006c, 0])
wb = Array{UInt16, 1}([0x002d, 0x0062, 0x0064, 0x0079, 0x002d, 0])
println(format("[{:08x}]", W32API.MBoxW(wb, wt)))
println(format("[{:08x}]", W32API.MBoxW("-bdy-", "ttl")))
wt = Array{UInt16, 1}([0x0074, 0x0074, 0x006c, 0x8868, 0x793a, 0x7533, 0])
wb = Array{UInt16, 1}([0x0062, 0x0064, 0x0079,
  0x65e5, 0x672c, 0x8a9e, 0x6f22, 0x5b57, 0x8868, 0x793a, 0x7533, 0x80fd, 0])
println(format("[{:08x}]", W32API.MBoxW(wb, wt)))
println(format("[{:08x}]", W32API.MBoxW("bdy日本語漢字表示申能", "ttl表示申")))
