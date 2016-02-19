# W32API.jl
# deps WCharUTF8

VERSION >= v"0.4.0-dev+6521" && __precompile__()
module W32API

import Base
import WCharUTF8
export MBox, MBoxA, MBoxW

function MBox(Msg::AbstractString, Title::AbstractString) # expect UTF8String
  return MBoxW(WCharUTF8.UTF8toWCS(Msg), WCharUTF8.UTF8toWCS(Title))
end

function MBoxA(Msg::AbstractString, Title::AbstractString) # expect ASCIIString
  user32 = Base.Libdl.dlopen_e("user32.dll")
  MessageBoxA = Base.Libdl.dlsym(user32, :MessageBoxA)
  err = ccall(MessageBoxA, stdcall,
    UInt, (Ptr{Void}, Ptr{UInt8}, Ptr{UInt8}, UInt),
    C_NULL, [Msg.data; [0x00]], [Title.data; [0x00]], 0)
  Base.Libdl.dlclose(user32)
  return err
end

function MBoxW(Msg::AbstractString, Title::AbstractString) # expect UTF8String
  return MBoxW(WCharUTF8.UTF8toWCS(Msg), WCharUTF8.UTF8toWCS(Title))
end

function MBoxW(Msg::Array{UInt16, 1}, Title::Array{UInt16, 1}) # expect wchar_t
  user32 = Base.Libdl.dlopen_e("user32.dll")
  MessageBoxW = Base.Libdl.dlsym(user32, :MessageBoxW)
  err = ccall(MessageBoxW, stdcall,
    UInt, (Ptr{Void}, Ptr{Cwchar_t}, Ptr{Cwchar_t}, UInt),
    C_NULL, [Msg; [0x0000]], [Title; [0x0000]], 0)
  Base.Libdl.dlclose(user32)
  return err
end

end
