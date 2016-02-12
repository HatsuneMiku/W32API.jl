W32API
======

[W32API](https://github.com/HatsuneMiku/W32API.jl)

W32API implements MessageBox for UTF8String .
It uses Win32API .

UTF8 string will be converted to wchar_t ( UTF16 ) string .


# MBox

```julia
MBox(Msg::AbstractString, Title::AbstractString) # expect UTF8String
```


# MBoxA

```julia
MBoxA(Msg::AbstractString, Title::AbstractString) # expect ASCIIString
```


# MBoxW

```julia
MBoxW(Msg::AbstractString, Title::AbstractString) # expect UTF8String
MBoxW(Msg::Array{UInt16, 1}, Title::Array{UInt16, 1}) # expect wchar_t
```


# Acknowledgements

now supports 32bit


# see also

[WCharUTF8](https://github.com/HatsuneMiku/WCharUTF8.jl)

# status

[![Build Status](https://travis-ci.org/HatsuneMiku/W32API.jl.svg?branch=master)](https://travis-ci.org/HatsuneMiku/W32API.jl)
