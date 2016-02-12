# w32api_tests.jl

import W32API
using Formatting
using Base.Test

println(format("[{:s}]", "test W32API"))
println(format("[{:08x}]", W32API.MBox("-bodystring-", "titletest")))
println(format("[{:08x}]", W32API.MBox("bdy日本語漢字表示申能", "ttl表示申")))
println(format("[{:08x}]", W32API.MBoxA("-AbodyAstringA-", "AtitleAtestA")))
println(format("[{:08x}]", W32API.MBoxA("brokenOK漢表申能", "brokenOK表示申")))
wt = Array{UInt16, 1}([0x0074, 0x0074, 0x006c, 0]) # w"ttl"
wb = Array{UInt16, 1}([0x002d, 0x0062, 0x0064, 0x0079, 0x002d, 0]) # w"-bdy-"
println(format("[{:08x}]", W32API.MBoxW(wb, wt)))
println(format("[{:08x}]", W32API.MBoxW("-callWbodyUTF8-", "callWtitleUTF8")))
wt = Array{UInt16, 1}([0x0074, 0x0074, 0x006c, 0x8868, 0x793a, 0x7533, 0])
wb = Array{UInt16, 1}([0x0062, 0x0064, 0x0079,
  0x65e5, 0x672c, 0x8a9e, 0x6f22, 0x5b57, 0x8868, 0x793a, 0x7533, 0x80fd, 0])
println(format("[{:08x}]", W32API.MBoxW(wb, wt)))
println(format("[{:08x}]", W32API.MBoxW("callW表申能UTF8", "callW表示申UTF8")))
@test W32API.MBox("ok", "last") == 0x00000001
# @test W32API.MBox(wb, wt) != 0x00000001 # no function
